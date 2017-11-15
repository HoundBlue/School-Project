
%Initialized values
tagID = uint64(45600);

readerID = uint64(800);

queryID = uint(9000); %This one will be the input used for queries 
 %from unauthorized readers
 
%Generate a random number from API of 0 to 45000
a = randi(45000);
    %to create a range of 9,000 to 54,000 for randomnumber
randoNum=uint64(9000+a);
%Figure out what the return number will be r' or new Rando
rShift = sum(dec2bin(randoNum)=='1');
rPrime = bitshift(randoNum,rShift);

%Xor the random number with the readerID within the API
doXor = bitxor(readerID,randoNum);

%RFID reader aspect and functions
%send query to the tag from the reader
query = doXor; % for now but switch to = queryID for unauthorized

%RFID Tag aspect and functions
%tag recieves query flag yes no

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
   
   %API needs to do xor to find the tagID
   findTag = bitxor(rPrime,returnQuery); %should give the API 
   %the correct tag ID
   rfidTag = uint64(findTag);
   
else
    disp('error, transmission not recognized')
end
 
