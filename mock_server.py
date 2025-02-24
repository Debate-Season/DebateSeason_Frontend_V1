from flask import Flask, jsonify
import time

app = Flask(__name__)

@app.route('/api/v1/chat/rooms/1/messages', methods=['GET'])
def mock_server():
    time.sleep(0.3)
    response_data = {
        "status": 200,
        "code": "SUCCESS",
        "message": "정상적으로 처리되었습니다",
        "data": {
            "messagesByDates": [
                {
                    "date": "2025-02-20",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "DISAGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        },
                        {
                       "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-21",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-21 13:30:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-22",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "DISAGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-22 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },{
                    "date": "2025-02-20",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        },
                        {
                       "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-21",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "DISAGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-21 13:30:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-22",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-22 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },{
                    "date": "2025-02-20",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        },
                        {
                       "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-21",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-21 13:30:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-22",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-22 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },{
                    "date": "2025-02-20",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        },
                        {
                       "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-21",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-21 13:30:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-22",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-22 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },{
                    "date": "2025-02-20",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        },
                        {
                       "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-21",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-21 13:30:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-22",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-22 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },{
                    "date": "2025-02-20",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        },
                        {
                       "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-21",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-21 13:30:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-22",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-22 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },{
                    "date": "2025-02-20",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        },
                        {
                       "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-21",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-21 13:30:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                {
                    "date": "2025-02-22",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-22 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
                
            ],
            "hasMore": True,
            "nextCursor": "string"
        }
    }

    return jsonify(response_data)


@app.route('/api/v1/chat/rooms/6/messages', methods=['GET'])
def mock_server2():
    time.sleep(1)
    response_data = {
        "status": 200,
        "code": "SUCCESS",
        "message": "정상적으로 처리되었습니다",
        "data": {
            "messagesByDates": [
                {
                    "date": "2025-02-20",
                    "chatMessageResponses": [
                        {
                            "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "DISAGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        },
                        {
                       "id": 0,
                            "messageType": "CHAT",
                            "sender": "string",
                            "content": "1string",
                            "opinionType": "AGREE",
                            "userCommunity": "string",
                            "timeStamp": "2025-02-20 13:31:34.579Z"
                        }
                    ],
                    "hasMore": True,
                    "totalCount": 0
                },
         {
            "date": "2025-02-02",
            "chatMessageResponses": [
                {
                    "id": 2,
                    "messageType": "CHAT",
                    "sender": "user2",
                    "content": "This update looks great!",
                    "opinionType": "AGREE",
                    "userCommunity": "developers",
                    "timeStamp": "2025-02-02T10:15:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        },
        {
            "date": "2025-02-03",
            "chatMessageResponses": [
                {
                    "id": 3,
                    "messageType": "CHAT",
                    "sender": "user3",
                    "content": "I think we need to improve performance.",
                    "opinionType": "DISAGREE",
                    "userCommunity": "developers",
                    "timeStamp": "2025-02-03T12:00:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        },
        {
            "date": "2025-02-04",
            "chatMessageResponses": [
                {
                    "id": 4,
                    "messageType": "CHAT",
                    "sender": "user4",
                    "content": "Anyone up for a coffee break?",
                    "opinionType": "AGREE",
                    "userCommunity": "general",
                    "timeStamp": "2025-02-04T14:45:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        },
        {
            "date": "2025-02-05",
            "chatMessageResponses": [
                {
                    "id": 5,
                    "messageType": "CHAT",
                    "sender": "user5",
                    "content": "This bug needs urgent attention.",
                    "opinionType": "DISAGREE",
                    "userCommunity": "testers",
                    "timeStamp": "2025-02-05T09:30:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        },
        {
            "date": "2025-02-06",
            "chatMessageResponses": [
                {
                    "id": 6,
                    "messageType": "CHAT",
                    "sender": "user6",
                    "content": "Can we reschedule the meeting?",
                    "opinionType": "AGREE",
                    "userCommunity": "management",
                    "timeStamp": "2025-02-06T11:00:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        },
        {
            "date": "2025-02-07",
            "chatMessageResponses": [
                {
                    "id": 7,
                    "messageType": "CHAT",
                    "sender": "user7",
                    "content": "I don't think that's a good idea.",
                    "opinionType": "DISAGREE",
                    "userCommunity": "general",
                    "timeStamp": "2025-02-07T13:20:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        },
        {
            "date": "2025-02-08",
            "chatMessageResponses": [
                {
                    "id": 8,
                    "messageType": "CHAT",
                    "sender": "user8",
                    "content": "This feature is amazing!",
                    "opinionType": "AGREE",
                    "userCommunity": "developers",
                    "timeStamp": "2025-02-08T15:10:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        },
        {
            "date": "2025-02-09",
            "chatMessageResponses": [
                {
                    "id": 9,
                    "messageType": "CHAT",
                    "sender": "user9",
                    "content": "I think we need more discussion on this.",
                    "opinionType": "DISAGREE",
                    "userCommunity": "management",
                    "timeStamp": "2025-02-09T16:45:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        },
        {
            "date": "2025-02-10",
            "chatMessageResponses": [
                {
                    "id": 10,
                    "messageType": "CHAT",
                    "sender": "user10",
                    "content": "Happy to be part of this team!",
                    "opinionType": "AGREE",
                    "userCommunity": "general",
                    "timeStamp": "2025-02-10T18:30:00.000Z"
                }
            ],
            "hasMore": False,
            "totalCount": 1
        }
            ],
            "hasMore": True,
            "nextCursor": "string"}}

    return jsonify(response_data)

if __name__ == '__main__':
    app.run(debug=True)