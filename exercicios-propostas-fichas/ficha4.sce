clc
clear

disp('3.')
function y = bissexto(ano)
    y = %f
    if(pmodulo(ano, 4) == 0)
        if(pmodulo(ano, 100) == 0 && pmodulo(ano, 400) ~= 0)
            y = %f
        else
            y = %t
         end
    end
endfunction

