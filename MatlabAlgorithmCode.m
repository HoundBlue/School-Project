


%Initialized values

tagID = uint64(902135);

 

readerID = uint64(800);% Keep
legitimate reader id the same during testing

 

genforTesting =
randi(9007199254740991);

extraBits = 1+(randi(2046));

queryID =
uint64((genforTesting*extraBits)); %This one will be the input used
for queries 

 %from unauthorized readers

    %For Testing:

    %Unauthorized Readers:

%A. Tag ID = 4567, Reader
ID = 45678 

%B. Tag ID = 12345, Reader
ID = 67890 

%C. Tag ID = 87654, Reader
ID = 908762 

%D. Tag ID = 1, Reader ID =
99999 

%E. Tag ID = 902135, Reader
ID = 23452 

 

%Generate a random number
from API of 0 to 18,446,744,073,709,551,615 


maxRand = 18446744073709551615;

minRand = 65535;

a =
(randi(9007199254740991)*extraBits);

    %to create a base range of at least
16 bits

randoNum=uint64(minRand+a);

%Figure out what the return
number will be r' or new Rando

rShift = sum(dec2bin(randoNum)=='1');

rPrime =
bitshift(randoNum,rShift);

 

%Xor the random number with
the readerID within the API

doXor = bitxor(readerID,randoNum);

 

%RFID reader aspect and
functions

%send query to the tag from
the reader

%query = doXor; % for now
but switch to = queryID for unauthorized

query = queryID; %use
instead for unauthorized reader tests

 

%RFID Tag aspect and
functions

%tag recieves query flag
yes no

 

%xor query with readerID
stored in memory to get random number

randoTest =
bitxor(readerID,query);% finds r

 

%test if random number is
within range

if ((minRand<=randoTest)
&& (randoTest<=maxRand)) 

    disp('query is within range')

%Perform counting of 1's
traversing the array since it is within range

onesCount = dec2bin(randoTest);

    %figure out how to traverse it

    N = sum(onesCount=='1');    

    % N equals number of 1's in the
randomnumber

  
shiftRando = uint64(randoTest);

    %shift randotest N bits to the
left

    newRando = bitshift(shiftRando,N); % new
rando is rr

    

    %xor the new random number from
the bitshift with the TagID

  
returnQuery = bitxor(newRando,tagID); % This is sent to the API

  


  
%API needs to do xor to find the tagID

  
findTag = bitxor(rPrime,returnQuery); %should give the API 

  
%the correct tag ID

  
rfidTag = uint64(findTag);

  


else

    disp('error, transmission not recognized')

end

 
