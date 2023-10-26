#!/bin/bash

ps axch -o cmd:15,%cpu --sort=%cpu | head
