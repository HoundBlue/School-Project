function [readerID, tagID] = fulldisclosure_bruteforce(t, t1, t2, s, s2)

% Note that r is accessed from least- to most-significant bit.
r = ''

% convert inputs to binary strings if necessary
t = dec2bin(t, 64)
t1 = dec2bin(t1, 64)
%s = dec2bin(s, 64)
%s2 = dec2bin(s2, 64)

% reverse binary strings so indexed from least- to most-significant bit
t = t(length(t):-1:1)
t1 = t1(length(t1):-1:1)
%s = s(length(s):-1:1)
%s2 = s2(length(s2):-1:1)

% case LSB of r == 0 (even)
for n = 0:63
	r(1+1) = num2str(bitxor(bitxor(bin2dec(t(n+1+1)), bin2dec(t1(n+1+1))), 1)) % that's a lot of ones
	for i = 0:62
		r(i+2+1) = num2str(bitxor(bitxor(bin2dec(t(n+2+i+1)), bin2dec(t1(n+2+i+1))), bin2dec(r(i+1+1))))
	end
	if n == sum(r=='1') && r(0+1) == 0
    
    % turn r back into a normal number for a while
    r = r(length(r):-1:1)
    r = bin2dec(r)
    
	  readerID = bitxor(s, r)
    tagID = bitxor(t, bitshift(r, n))
    if t2 == bitxor(tagID, bitshift(bitxor(readerID, s2), sum(dec2bin(bitxor(readerID, s2)) == '1')))
      return
    end
    
    % in case reader and tag IDs returned not having been found
    readerID = -1
    tagID = -1
    
    % convert r back into a binary string for index manipulation
    r = dec2bin(r)
    r = r(length(r):-1:1)
    
  end
end

% case LSB of r == 1 (odd)
for n = 1:64
  r(127+1) = num2str(bitxor(bin2dec(t(n-1+1)), bin2dec(t1(n-1+1))))
  for i = 0:62
    r(126-i+1) = num2str(bitxor(bitxor(bin2dec(t(n-2+i+1)), bin2dec(t1(n-2+i+1))), bin2dec(r(127-i+1))))
  end
  if n == sum(r=='1') && r(0+1) == 1
    
    % turn r back into a normal number for a while
    r = r(length(r):-1:1)
    r = bin2dec(r)
    
    readerID = bitxor(s, r)
    tagID = bitxor(t, bitshift(r, n))
    if t2 == bitxor(tagID, bitshift(bitxor(readerID, s2), sum(dec2bin(bitxor(readerID, s2)) == '1')))
      return
    end
    
    % in case reader and tag IDs returned not having been found
    readerID = -1
    tagID = -1
    
    % convert r back into a binary string for index manipulation
    r = dec2bin(r)
    r = r(length(r):-1:1)
    
  end
end

end