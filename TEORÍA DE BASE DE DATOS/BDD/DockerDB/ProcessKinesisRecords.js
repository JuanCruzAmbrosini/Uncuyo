const AWS = require('aws-sdk');

const dynamo = new AWS.DynamoDB.DocumentClient({
  endpoint: 'http://localhost:4566',
  region: 'us-east-1'
});

exports.kinesisHandler = async (event) => {
  for (const record of event.Records) {
    const payload = Buffer.from(record.kinesis.data, 'base64').toString('utf-8');
    const item = JSON.parse(payload);

    await dynamo.put({
      TableName: 'SensorData',
      Item: item
    }).promise();

    console.log('Guardado:', item);
  }
  return { status: 'ok' };
};
