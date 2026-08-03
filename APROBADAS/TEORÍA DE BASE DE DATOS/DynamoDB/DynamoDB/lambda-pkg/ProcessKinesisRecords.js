var AWS = require("aws-sdk");

var DynamoDB = new AWS.DynamoDB({
  apiVersion: "2012-08-10",
  region: "us-east-1",
  endpoint: "http://localhost:4566",
  accessKeyId: "test",
  secretAccessKey: "test"
});

exports.kinesisHandler = function(event, context, callback) {
  var kinesisRecord = event.Records[0];
  // Decodificar el dato Base64 del record de Kinesis
  var data = Buffer.from(kinesisRecord.kinesis.data, "base64").toString("ascii");
  var obj  = JSON.parse(data);

  var sensorId    = obj.sensor_id;
  var currentTime = obj.current_time;
  var temperature = obj.temperature;

  var item = {
    TableName: "SensorData",
    Item: {
      SensorId:    { S: sensorId },
      CurrentTime: { N: currentTime.toString() },
      Temperature: { N: temperature.toString() }
    }
  };

  DynamoDB.putItem(item, function(err, data) {
    if (err) {
      console.log(err, err.stack);
      callback(err.stack);
    } else {
      console.log("Item guardado:", JSON.stringify(item.Item));
      callback(null, data);
    }
  });
};
