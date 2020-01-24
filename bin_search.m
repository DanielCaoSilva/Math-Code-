clear all; 
close all;
clc;

vec = [0, 1, 15, 35,55,70,100];
[ind] = bina_search(vec,1,7,100);


function [index] = bina_search(vector,beg,last,goal)

    if(last>=1)
        mid = floor((beg + last) / 2); 
  
            % If the element is present at the 
            % middle itself 
        %disp(mid);
        if goal == vector(mid) 
            index = mid;
            disp(index);
            return;
        end
            % If element is smaller than mid, then 
            % it can only be present in left subarray 
        if vector(mid) > goal 
            last = mid-1;
            bina_search(vector, beg, last, goal); 
        end
            % Else the element can only be present 
            % in right subarray 
        beg = mid + 1;
        bina_search(vector, beg, last, goal);
    end
    index = -1;
    return;
end

    