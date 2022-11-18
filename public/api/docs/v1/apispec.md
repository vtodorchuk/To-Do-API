{
  "openapi": "3.0.0",
  "info": {
    "title": "API",
    "description": "",
    "version": "1.0"
  },
  "paths": {
    "/api/v1/projects": {
      "get": {
        "summary": "Create an projects",
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
                        "id": 55,
                        "name": "modi",
                        "user_id": 101
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
                      "name": "voluptate",
                      "id": 58,
                      "user_id": 106
                    }
                  },
                  "update projects": {
                    "summary": "update projects",
                    "value": {
                      "name": "minima",
                      "id": 59,
                      "user_id": 107
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
          "404": {
            "description": "Not Found",
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
          },
          "201": {
            "description": "Created",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "id": 57,
                      "name": "quam",
                      "user_id": 104
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
          "422": {
            "description": "Unprocessable Entity",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "errors": [
                        "Name can't be blank"
                      ]
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
                  "value": "name=voluptate"
                },
                "update projects": {
                  "summary": "update projects",
                  "value": "name=minima"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/projects/{id}": {
      "get": {
        "summary": "Delete an projects",
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
            "example": "60"
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
                      "id": 56,
                      "name": "id",
                      "user_id": 102
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
          "404": {
            "description": "Not Found",
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
    "/api/v1/sing_in": {
      "post": {
        "summary": "Get sessions tokens",
        "tags": [
          "Sessions"
        ],
        "description": "",
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
                  "value": "email=lili_goldner%40treutel.us&password=password"
                },
                "has return json with tokens": {
                  "summary": "has return json with tokens",
                  "value": "email=aurelio_jacobi%40kuphalbergnaum.info&password=password"
                },
                "has status unauthorized": {
                  "summary": "has status unauthorized",
                  "value": "email=jed.mraz%40donnellymarquardt.us&password=wrong_password"
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
                      "user_id": 111,
                      "session": {
                        "csrf": "9w5pZn0PjHmTOUuy0hiTlwTp2IzXIMT5Plarf5gAqBlk2xk9kCJALuZcsRK1Jq0zwCOC2E7XNyDhZ3CaIjVsYQ==",
                        "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Njg3NjUyMzYsInVzZXJfaWQiOjExMSwidWlkIjoiNmE2OTQwZjctZWMzYy00Y2I5LWFkNDUtMjc4OTU2MzMxYzRkIiwicnVpZCI6Ijk2NDA1N2ZjLThkZWYtNDNjZS1iNjhkLTM3MjM0ZTI2ZDY3MiJ9.dAo_CeMVNQDmL2066KOTx4_TyLALY67-qCn5WCk7duY",
                        "access_expires_at": "2022-11-18T11:53:56.000+02:00",
                        "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjkzNjY0MzYsInVpZCI6Ijk2NDA1N2ZjLThkZWYtNDNjZS1iNjhkLTM3MjM0ZTI2ZDY3MiJ9.VzuHAVw8pLaghXTUhdAxp2KrZQlWYljecVfM4xTotck",
                        "refresh_expires_at": "2022-11-25T10:53:56.000+02:00"
                      }
                    }
                  },
                  "has return json with tokens": {
                    "summary": "has return json with tokens",
                    "value": {
                      "user_id": 112,
                      "session": {
                        "csrf": "egkT6eV4iNzmly+pFcrdxvOVbp0Y134Jkyf0PPsPabgu5cKjGz0bUDOYtk9EJDI87wmaiBU9xPuiuID7TUvIVA==",
                        "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Njg3NjUyMzYsInVzZXJfaWQiOjExMiwidWlkIjoiYTYzZDE3NzktNmZjZi00Y2VkLWJiMzMtNTlmOWZjN2Q2YjZkIiwicnVpZCI6ImY2N2YwOWJmLTRhYzctNGRmYS1iZjI5LTM2YWIwYmFhYTQ0ZiJ9.4Mse2pjRUxAxkxE5G-VX_Z6ge6xjmZFZTYpVZfuxk20",
                        "access_expires_at": "2022-11-18T11:53:56.000+02:00",
                        "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjkzNjY0MzYsInVpZCI6ImY2N2YwOWJmLTRhYzctNGRmYS1iZjI5LTM2YWIwYmFhYTQ0ZiJ9.X8_8EugdwZOyoTXKLS9pLSr04SrKEnRnfbPrWjwUB4w",
                        "refresh_expires_at": "2022-11-25T10:53:56.000+02:00"
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
          },
          "401": {
            "description": "Unauthorized",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status unauthorized": {
                    "summary": "has status unauthorized",
                    "value": null
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
    "/api/v1/sing_out": {
      "delete": {
        "summary": "Delete sessions tokens",
        "tags": [
          "Sessions"
        ],
        "description": "",
        "parameters": [
          {
            "name": "X-Csrf-Token",
            "in": "header",
            "example": "BGOVwn6A/JtoZJIQZTXivA05cJ4qkhDP5H3K/iGtOp3eXlM3Aj535v7hxNDvRs3pzJNPd7F9eJYBW5Ppapw2BA=="
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
                  "has status success": {
                    "summary": "has status success",
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
            "example": "51"
          },
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "35"
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
                        "id": 9,
                        "task_id": 31,
                        "body": "Qui repudiandae quod temporibus unde reprehenderit suscipit."
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
          "404": {
            "description": "Not Found",
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
          },
          "201": {
            "description": "Created",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "id": 11,
                      "task_id": 35,
                      "body": "Id dignissimos assumenda et temporibus animi dolor pariatur porro."
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
          "422": {
            "description": "Unprocessable Entity",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "errors": [
                        "Body is too long (maximum is 500 characters)"
                      ]
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
            "example": "49"
          },
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "33"
          },
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "10"
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
                      "id": 10,
                      "task_id": 33,
                      "body": "Doloribus explicabo necessitatibus recusandae sunt expedita dolorem."
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
          "404": {
            "description": "Not Found",
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
            "example": "53"
          },
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "37"
          },
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "12"
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
          },
          "404": {
            "description": "Not Found",
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
            "example": "64"
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
                        "id": 39,
                        "project_id": 61,
                        "title": "nisi",
                        "completed": false,
                        "deadline": "2022-11-21T08:53:56.772Z",
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
          "404": {
            "description": "Not Found",
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
          },
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "title": "laudantium",
                      "project_id": 65,
                      "id": 42,
                      "completed": false,
                      "deadline": "2022-11-21T08:53:56.902Z",
                      "position": 0
                    }
                  },
                  "update task": {
                    "summary": "update task",
                    "value": {
                      "title": "consequatur",
                      "project_id": 66,
                      "id": 43,
                      "completed": false,
                      "deadline": "2022-11-21T08:53:56.932Z",
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
                      "id": 41,
                      "project_id": 64,
                      "title": "mollitia",
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
          },
          "422": {
            "description": "Unprocessable Entity",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "has status": {
                    "summary": "has status",
                    "value": {
                      "errors": [
                        "Project must exist"
                      ]
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
                  "value": "title=laudantium"
                },
                "update task": {
                  "summary": "update task",
                  "value": "title=consequatur"
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
            "example": "62"
          },
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "40"
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
                      "id": 40,
                      "project_id": 62,
                      "title": "minima",
                      "completed": false,
                      "deadline": "2022-11-21T08:53:56.820Z",
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
          "404": {
            "description": "Not Found",
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
            "example": "68"
          },
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "45"
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
          },
          "404": {
            "description": "Not Found",
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
    "/api/v1/users": {
      "post": {
        "summary": "Get sessions tokens",
        "tags": [
          "Users"
        ],
        "description": "",
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
                  "value": "email=clyde%40ledner.co.uk&password=password&password_confirmation=password"
                },
                "has return json with tokens": {
                  "summary": "has return json with tokens",
                  "value": "email=gil%40upton.name&password=password&password_confirmation=password"
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
                        "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Njg3NjUyMzcsInVzZXJfaWQiOjEyNSwidWlkIjoiNDIyNjllMTQtMjU2OS00MjZlLTk4MTktNzllMzY0MTU4MzJhIiwicnVpZCI6ImViZjhiOWZjLWFhMTAtNGM5Yy04MjAzLTUwNzcwMWNjMWZhMyJ9.GCiRwC0MDvj13NEZXpdFJimPHPOD1P5JMbvMmAdDA9o",
                        "csrf": "s9C9qyKJZ2LIYN1GnpMBGyRgOtgFQNFLwrUzPsZ83zN/3IAtdjqqJEycsTy/SeEreK0O0HUPiKHeH/Jv+qLPCA=="
                      }
                    }
                  },
                  "has return json with tokens": {
                    "summary": "has return json with tokens",
                    "value": {
                      "user": {
                        "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Njg3NjUyMzcsInVzZXJfaWQiOjEyNiwidWlkIjoiZThiNGVkY2EtODU0OS00YmMyLTlmYzUtNTM0ODkzNDcwOTIwIiwicnVpZCI6ImJiMjIwYzIyLTA1OWMtNDgzOS05ZjIxLWYzMWVjNDhiNzdlNyJ9.Hvw9gMD-eMBJVJZ5hA6yfHQlWIPgNGoNVjDuWqD_3BY",
                        "csrf": "WvDVyCWshmygUtdniyFQkkYoEKCcVFk1GXLysgx6VRPlDzmZRZAOuycR6Djh64pW+1cisO896AqM79Jiieqr3A=="
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
