% assumes (tagID, readerID) = (4321534, 5430)

%Initialized values
tagID = uint64(4321534);

readerID = uint64(5340);

queryID = uint64(9000); %This one will be the input used for queries 
                        %from unauthorized readers
 
%Generate a random number from API of 0 to 45000
a = randi(45000);
%to create a range of 9,000 to 54,000 for randomnumber
randoNum=uint64(9000+a);

% Attacker eavesdrops and collects these.
s = bitxor(readerID, randoNum)
t = cwh_sendToTag(s)  % == bitxor(tagID, rPrime)

s1 = bitxor(s, 1)
t1 = cwh_sendToTag(s1)

%lim = 2^63 - 1
s2 = randi(flintmax() - 1)
t2 = cwh_sendToTag(s2)

fulldisclosure_bruteforce(t, t1, t2, s, s2)