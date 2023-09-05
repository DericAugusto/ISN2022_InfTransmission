function dictionnaire = dictionnaire(Ma, noms)
%Ma = [0 0 0 0 0 0 1;0 0 0 0 1 0 0;0 0 0 0 1 0 0;0 0 0 0 0 1 0;0 0 0 0 0 1 0;0 0 0 0 0 0 1;0 0 0 0 0 0 0];
%noms = [1, 1, 0, 0, 1, 0];
    dictionnaire = {};
    % the dictionary will be a cell array whose size is the number of distinct characters.
    for i = 1 : 1 : fix(length(Ma)/2) + 1
        % We start reading the tree to find the binary values of the characters
        % The last digit of the binary for each character is the same digit that corresponds to the digit in the array noms
        dictionnaire{i} = [noms(i)];
        % We read each row of the matrix Ma looking for the digit 1
        % We will call index the row in which it is found
        index = find(Ma(i, :) == 1);
        % If the column in which the value 1 is found is not the last column of the array Ma, we continue to build the character value inside the while loop
        while index ~= length(Ma)
            % The penultimate digit of the character binary will be the same digit of the array noms that corresponds to the calculated index
            dictionnaire{i} = [noms(index), dictionnaire{i}];
            index = find(Ma(index, :) == 1); % we recalculate the index
        end
    end
end