# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM node:20-slim

WORKDIR /usr/src/app

COPY package*.json ./

# File doesn't exist
COPY this-specific-file.sh ./

# Shell syntax error
RUN PATH="$PATH:~/bin"

# Runs broken script
RUN sh broken-script.sh

RUN npm install --only=production

COPY . ./

CMD [ "npm", "start" ]