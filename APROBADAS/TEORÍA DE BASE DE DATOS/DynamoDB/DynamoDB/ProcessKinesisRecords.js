const { DynamoDBClient, PutItemCommand } = require("@aws-sdk/client-dynamodb");

// LocalStack inyecta AWS_ENDPOINT_URL en el container de la Lambda
const client = new DynamoDBClient({
  region: process.env.AWS_DEFAULT_REGION || "us-east-1",
  endpoint: process.env.AWS_ENDPOINT_URL || "http://localhost:4566",
  credentials: {
    accessKeyId:     process.env.AWS_ACCESS_KEY_ID     || "test",
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY || "test"
  }
});

exports.kinesisHandler = async function(event, context) {
  const kinesisRecord = event.Records[0];
  const data = Buffer.from(kinesisRecord.kinesis.data, "base64").toString("ascii");
  const obj  = JSON.parse(data);

  const command = new PutItemCommand({
    TableName: "SensorData",
    Item: {
      SensorId:    { S: obj.sensor_id },
      CurrentTime: { N: obj.current_time.toString() },
      Temperature: { N: obj.temperature.toString() }
    }
  });

  const result = await client.send(command);
  console.log("Item guardado:", JSON.stringify({ sensor_id: obj.sensor_id }));
  return result;
};
