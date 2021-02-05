#!/bin/bash

ps axch -o cmd:15,%mem --sort=%mem | head
