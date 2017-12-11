# School-Project
For Senior Project CSC 450
Emily and Zach

The research project objective consists of implementing an increased 
security algorithm within a Matlab simulation environment. Intent is 
for the increased security to be applicable to RFID systems for 
encrypted ID transmission. We focused specifically on the transmittal 
between RFID tag and reader. Two part project. Part A is algorithm 
implementation and random number range testing Part B is unauthorized
Reader and Full disclosure attack testing.

Algorithm is a basic XOR with random number implementation and bitshift
which verifies the ReaderID's and TagID's between devices prior to 
information sharing. Original algorithm implementation was ispired by:

[Y. Chen, W. Wang, and M. Hwang, Low-Cost RFID
Authentication Protocol for Anti-Counterfeiting and Privacy Protection.]

with the random number range kick was added as an improvement to the 
vulnerability of the Tag returning no matter if the reader is authorized
or not. Corresponding image of Diagram of the algorithm implementation is 
provided in order to provide in depth explanation. 
