%% 1. Read the text file provided to you using MATLAB and compute the approximate & 2. Calculate the entropy probabilities of the different English characters (symbols) in this text file.
clear; clc;
file_name = "Test_Text_File.txt"; % enter the file name conraining the message
message = GetMessage(file_name);
fprintf("the message is\n %s \n",message );
[entropy, probability, chars] = GetProbAndEntorpy(message); 
fprintf("the entropy of the message is\n %f \n", entropy );
fprintf("The sum of probabilities is %f \n ",sum(probability) );
for n = 1: length(probability)
fprintf("the probabilty of character %c is %f  \n", chars(n), probability(n) );
end
%% 3. Calculate the number of bits/symbols required to construct a fixed length code and calculate the efficiency of that code.
const_bits_per_symbol = GetBitsPerSymbol(chars); 
const_code_efficiency = (entropy/const_bits_per_symbol) * 100;
fprintf("the number of bits/symbols required to construct a fixed length code is %f bits/symbol \n",const_bits_per_symbol )
fprintf("The fixed length code efficiency is %f%% \n",const_code_efficiency );
%% 4. Implement in MATLAB the Huffman encoder function and encode the file characters into a stream of zeros and ones.
dictionary = GetHufmanCodes(chars ,probability);
class(dictionary.code)
%fprintf(" The dictionary \n ")
%for n = 1 : length(dictionary.code)
 %   disp(dictionary.symbol(n));
  %  disp(dictionary.code(n))
%end
encoded_message = HuffmanEncode(message, dictionary);
encoded_message = char(encoded_message);
%fprintf("The encoded message is \n %s \n", encoded_message );
%% 5. Implement in MATLAB the Huffman decoder function and write the decoded stream of characters back to a separate text file,
decoded_message = HuffmanDecode(encoded_message, dictionary);
Recieved_message = char(decoded_message);
Recieved_message =  convertCharsToStrings(Recieved_message);
fileID = fopen( 'Recieved message.txt', 'wt' );
fprintf(fileID, Recieved_message );
fclose(fileID);
verification_flag = strcmp(message , Recieved_message);
if verification_flag == 1
fprintf(" The message was Recieved correctly and the  Recieved message is \n %s \n ", Recieved_message );
else 
    fprintf("The message was corrupted \n");
end
    
%% 6. Calculate the efficiency of the Huffman code.
average_codeword_length = GetAvreageCodeWord(probability, dictionary);
Huffman_code_efficiency = (entropy / average_codeword_length) * 100;
fprintf("Aerage codeword of Huffman code is %f bits/symbol \n",average_codeword_length);
fprintf("The efficiency of the Huffman code is %f %% \n", Huffman_code_efficiency)
