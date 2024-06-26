The design is made based on following order of decreasing priority : requestor0 > requestor1 > requestor2

From the waveform, it can be seen that :

    - requestor2 asserts its request signal, while those for the other two requestors stay low, making grant2 high  
      ( req[2:0] : 'd4, grant[2:0] : 'd4)

    - requestor1 asserts its request signal, while those for the other two requestors stay low, making grant1 high  
      ( req[2:0] : 'd2, grant[2:0] : 'd2)

    - requestor0 asserts its request signal, while those for the other two requestors stay low, making grant0 high  
      ( req[2:0] : 'd1, grant[2:0] : 'd1)

    - there is a region of overlap between request0 and request2, where grant0 goes high because of its higher priority 
      (req[2:0] : 'd5, grant[2:0] : 'd1)

    - similarly, when all the requestors assert their request signals, the one with the highest priority (requestor0) gets the grant 
      (req[2:0] : 'd7, grant[2:0] : 'd1)

In other words, when two or more requests arrive at a time, the design grants the access to the one with highest priority, hence it is called priority arbiter.
