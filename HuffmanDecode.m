function decoded_message = HuffmanDecode(encoded_message, dictionary)
decoded_message = [];
encoded_message_ = encoded_message;
position = 1 ;
while( ~isempty(encoded_message_))
    transition_code = encoded_message_(position);
    dictionary_copy = dictionary;
    while(1)
         dictionary_ = FindMatch(transition_code , position, dictionary_copy); 
         dictionary_copy = dictionary_;
        if ( length(dictionary_copy.code) ~= 1) 
                position = position + 1;   
                transition_code = encoded_message_(position);
        else 
                    position = 1 ;
                    encoded_message_ = encoded_message_(length(dictionary_copy.code{1})+1: end);
                    break;
        end
    end
    decoded_message = [decoded_message dictionary_copy.symbol];
    
end
end


function dictionary = FindMatch(transition_code , position, dictionary_copy)
 dictionary.symbol={}; dictionary.code={}; % Create a dictionary structure.
  j = 1;
   for i = 1:length(dictionary_copy.code)
      class(cellstr(dictionary_copy.symbol(i)))
        if ( strcmp(dictionary_copy.code{i}(position), transition_code))
            dictionary.symbol(j) = cellstr(dictionary_copy.symbol(i)); 
            dictionary.code(j) = dictionary_copy.code(i);     
            j = j + 1;                   
        end
   end
end