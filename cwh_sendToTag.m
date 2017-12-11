function [returnQuery] = cwh_sendToTag(query)
  
  %RFID Tag aspect and functions
  %tag recieves query flag yes no

  % For the purpose of the full-disclosure test, assume the paired readerID is this.
  readerID = 5430
  tagID = 4321534
  
  %xor query with readerID stored in memory to get random number
  randoTest = bitxor(readerID,query);% finds r

  %test if random number is within range
  if ((9000<=randoTest) && (randoTest<=54000)) 
      disp('query is within range')
      %Perform counting of 1's traversing the array since it is within range
      onesCount = dec2bin(randoTest);
      %figure out how to traverse it
      N = sum(onesCount=='1');    
      % N equals number of 1's in the randomnumber
      shiftRando = uint64(randoTest);
      %shift randotest N bits to the left
      newRando = bitshift(shiftRando,N); % new rando is rr
      
      %xor the new random number from the bitshift with the TagID
      returnQuery = bitxor(newRando,tagID); % This is sent to the API
     
  else
      disp('error, transmission not recognized')
  end
  
end