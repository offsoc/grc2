import std/[json, jsonutils, times]

import ../types

proc clientToJson*(client: C2Client): JsonNode =
  %*{
    "id": client.id,
    "hash": client.hash,
    "ipAddress": client.ipAddress,
    "hostname": client.hostname,
    "username": client.username,
    "osType": client.osType,
    "lastCheckin": client.lastCheckin.toTime.toUnix,
    "windowsVersionInfo": client.windowsVersionInfo,
    "linuxVersionInfo": client.linuxVersionInfo,
    "initialized": client.loaded
  }


proc taskToJson*(task: Task): JsonNode =
  %*{
    "client": task.client.id,
    "id": task.id,
    "action": task.action,
    "status": $task.status,
    "arguments": toJson task.arguments,
    "output": task.output
  }