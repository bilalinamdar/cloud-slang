#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0

namespace: io.cloudslang

imports:
  ops: user.ops

flow:
  name: flow_name_step_result_before
  workflow:
    - COLLISION_ITEM:
        do:
          ops.test_op:
            - alla: 'message 1'
        navigate:
          - SUCCESS: step_2
          - FAILURE: step_2

    - step_2:
        do:
          ops.test_op:
            - alla: 'message 1'
        navigate:
          - SUCCESS: print_message2
          - FAILURE: COLLISION_ITEM

    - print_message2:
        do:
          ops.test_op:
            - alla: 'message 1'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: SUCCESS
  results:
    - SUCCESS
    - COLLISION_ITEM
