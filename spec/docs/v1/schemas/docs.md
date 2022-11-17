{
  "openapi": "3.0.0",
  "info": {
    "title": "API Documentation",
    "description": "",
    "version": "1.0"
  },
  "paths": {
    "/api/v1/projects": {
      "get": {
        "summary": "Create an project",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "responses": {
          "302": {
            "description": "Found",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": [
                      {
                        "id": 283,
                        "name": "nisi",
                        "user_id": 504
                      }
                    ]
                  },
                  "get projects": {
                    "summary": "get projects",
                    "value": [
                      {
                        "id": 284,
                        "name": "deleniti",
                        "user_id": 505
                      }
                    ]
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "name": "inventore",
                      "id": 289,
                      "user_id": 510
                    }
                  },
                  "update project": {
                    "summary": "update project",
                    "value": {
                      "name": "labore",
                      "id": 290,
                      "user_id": 511
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "201": {
            "description": "Created",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "id": 287,
                      "name": "rerum",
                      "user_id": 508
                    }
                  },
                  "add project": {
                    "summary": "add project",
                    "value": {
                      "id": 288,
                      "name": "enim",
                      "user_id": 509
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        },
        "requestBody": {
          "content": {
            "any": {
              "examples": {
                "has status": {
                  "summary": "has status",
                  "value": "name=inventore"
                },
                "update project": {
                  "summary": "update project",
                  "value": "name=labore"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/projects/{id}": {
      "get": {
        "summary": "Delete an project",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "291"
          }
        ],
        "responses": {
          "302": {
            "description": "Found",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "id": 285,
                      "name": "placeat",
                      "user_id": 506
                    }
                  },
                  "show project": {
                    "summary": "show project",
                    "value": {
                      "id": 286,
                      "name": "aperiam",
                      "user_id": 507
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "200": {
            "description": "OK",
            "content": {
              "text/plain; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": " "
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "text/plain; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/sing_in": {
      "post": {
        "summary": "Get sessions tokens",
        "tags": [
          "Users"
        ],
        "description": "Sing in",
        "parameters": [
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "requestBody": {
          "content": {
            "any": {
              "examples": {
                "has status success": {
                  "summary": "has status success",
                  "value": "email=katina%40gorczanyrosenbaum.biz&password=password&password_confirmation=password"
                },
                "has return json with tokens": {
                  "summary": "has return json with tokens",
                  "value": "email=anisa%40nolan.name&password=password&password_confirmation=password"
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "Created",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status success": {
                    "summary": "has status success",
                    "value": {
                      "user": {
                        "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Njg1MTkxODUsInVzZXJfaWQiOjUyNiwidWlkIjoiNDU5NTczZjUtMDcyOS00MmNlLTlhNmUtYTQwM2IzYmMyNzcxIiwicnVpZCI6ImI1YTQzNWQwLWIzNjMtNDA2Yi1iYzdlLTI5NGUxYWYwNjkzNSJ9.jMnxjM622ZLtTxlZYC44BmwmAoAFB-nebKq-4qpZFdE",
                        "csrf": "M5DnTpENHNOZzOTgVgn2FLi6MDUIxg2Sfzj411u7qQ+B4VapeIKawtYXLPp3SF80etrT5FuVTXHqH7tUb0Hlsg=="
                      }
                    }
                  },
                  "has return json with tokens": {
                    "summary": "has return json with tokens",
                    "value": {
                      "user": {
                        "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Njg1MTkxODUsInVzZXJfaWQiOjUyNywidWlkIjoiMDQyNGM2NWYtYmFiZS00MmY2LWI5OTktZmZhOWU2YTU3NzIyIiwicnVpZCI6ImQ4NzFhMDRhLTBhMWMtNGRkNi1iNDBhLWRiMDkxNjA1MmNiNSJ9.foSk7PJ4YCILQ40hLf_pNzjkXI_uD5ftwdXcw2sULEA",
                        "csrf": "VpAHn7KZAh8Eepo28xDCFJ0Ov9wgmXdhUnjmkt2CcXN2vQUy/2j0HDm1kXDcFTOaeAijtSxuBjO4FVdep1WOHw=="
                      }
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/sing_out": {
      "delete": {
        "summary": "Delete sessions tokens",
        "tags": [
          "Sessions"
        ],
        "description": "Sing out",
        "parameters": [
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "text/plain; charset=utf-8": {
                "examples": {
                  "has status success": {
                    "summary": "has status success",
                    "value": " "
                  },
                  "has return json with tokens": {
                    "summary": "has return json with tokens",
                    "value": " "
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "text/plain; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/api/v1/projects/{project_id}/tasks/{task_id}/comments": {
      "get": {
        "summary": "Create an comment",
        "tags": [
          "Comment"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "280"
          },
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "187"
          }
        ],
        "responses": {
          "302": {
            "description": "Found",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": [

                    ]
                  },
                  "get comments": {
                    "summary": "get comments",
                    "value": [

                    ]
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "201": {
            "description": "Created",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "id": 48,
                      "task_id": 187,
                      "body": "voluptas"
                    }
                  },
                  "add comment": {
                    "summary": "add comment",
                    "value": {
                      "id": 49,
                      "task_id": 188,
                      "body": "eum"
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/api/v1/projects/{project_id}/tasks/{task_id}/comments/{id}": {
      "get": {
        "summary": "Get an comment",
        "tags": [
          "Comment"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "278"
          },
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "185"
          },
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "46"
          }
        ],
        "responses": {
          "302": {
            "description": "Found",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "id": 46,
                      "task_id": 185,
                      "body": "numquam"
                    }
                  },
                  "show comment": {
                    "summary": "show comment",
                    "value": {
                      "id": 47,
                      "task_id": 186,
                      "body": "quisquam"
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      },
      "delete": {
        "summary": "Delete an comment",
        "tags": [
          "Comment"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "282"
          },
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "189"
          },
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "50"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "text/plain; charset=utf-8": {
                "examples": {
                  "delete comment": {
                    "summary": "delete comment",
                    "value": " "
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "text/plain; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/api/v1/projects/{project_id}/tasks": {
      "get": {
        "summary": "Create an task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "296"
          }
        ],
        "responses": {
          "302": {
            "description": "Found",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": [
                      {
                        "id": 190,
                        "project_id": 292,
                        "title": "architecto",
                        "completed": false,
                        "deadline": "2022-11-18T12:33:05.264Z",
                        "position": 0
                      }
                    ]
                  },
                  "get tasks": {
                    "summary": "get tasks",
                    "value": [
                      {
                        "id": 191,
                        "project_id": 293,
                        "title": "sunt",
                        "completed": false,
                        "deadline": "2022-11-18T12:33:05.288Z",
                        "position": 0
                      }
                    ]
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "title": "quidem",
                      "project_id": 298,
                      "id": 196,
                      "completed": false,
                      "deadline": "2022-11-18T12:33:05.400Z",
                      "position": 0
                    }
                  },
                  "update task": {
                    "summary": "update task",
                    "value": {
                      "title": "voluptate",
                      "project_id": 299,
                      "id": 197,
                      "completed": false,
                      "deadline": "2022-11-18T12:33:05.423Z",
                      "position": 0
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "201": {
            "description": "Created",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "id": 194,
                      "project_id": 296,
                      "title": "quae",
                      "completed": false,
                      "deadline": null,
                      "position": 0
                    }
                  },
                  "add task": {
                    "summary": "add task",
                    "value": {
                      "id": 195,
                      "project_id": 297,
                      "title": "dolore",
                      "completed": false,
                      "deadline": null,
                      "position": 0
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        },
        "requestBody": {
          "content": {
            "any": {
              "examples": {
                "has status": {
                  "summary": "has status",
                  "value": "title=quidem"
                },
                "update task": {
                  "summary": "update task",
                  "value": "title=voluptate"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/projects/{project_id}/tasks/{id}": {
      "get": {
        "summary": "Get an task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "294"
          },
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "192"
          }
        ],
        "responses": {
          "302": {
            "description": "Found",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "id": 192,
                      "project_id": 294,
                      "title": "rerum",
                      "completed": false,
                      "deadline": "2022-11-18T12:33:05.318Z",
                      "position": 0
                    }
                  },
                  "show task": {
                    "summary": "show task",
                    "value": {
                      "id": 193,
                      "project_id": 295,
                      "title": "tenetur",
                      "completed": false,
                      "deadline": "2022-11-18T12:33:05.337Z",
                      "position": 0
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      },
      "delete": {
        "summary": "Delete an task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "300"
          },
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "198"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "text/plain; charset=utf-8": {
                "examples": {
                  "destroy task": {
                    "summary": "destroy task",
                    "value": " "
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "text/plain; charset=utf-8"
              }
            }
          }
        }
      }
    }
  },
  "tags": [
    {
      "name": "Projects",
      "description": ""
    },
    {
      "name": "Sessions",
      "description": ""
    },
    {
      "name": "Comment",
      "description": ""
    },
    {
      "name": "Tasks",
      "description": ""
    },
    {
      "name": "Users",
      "description": ""
    }
  ],
  "x-tagGroups": [
    {
      "name": "Projects",
      "tags": [
        "Projects"
      ]
    },
    {
      "name": "Sessions",
      "tags": [
        "Sessions"
      ]
    },
    {
      "name": "Tasks",
      "tags": [
        "Comment",
        "Tasks"
      ]
    },
    {
      "name": "Users",
      "tags": [
        "Users"
      ]
    }
  ]
}
