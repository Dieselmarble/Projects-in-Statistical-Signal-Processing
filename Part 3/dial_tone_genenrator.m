function [dialtone] = dial_tone_genenrator(digit,time)
    
    switch digit
        case 0 
            dialtone = sin(pi*1336*time/2)+sin(pi*941*time/2);
        case 1 
            dialtone = sin(2*pi*1209*time/4)+sin(2*pi*697*time/4);
        case 2
            dialtone = sin(2*pi*1336*time/4)+sin(2*pi*697*time/4);
        case 3
            dialtone = sin(2*pi*1477*time/4)+sin(2*pi*697*time/4);
        case 4
            dialtone = sin(2*pi*770*time/4)+sin(2*pi*1209*time/4);
        case 5
            dialtone = sin(2*pi*770*time/4)+sin(2*pi*1336*time/4);
        case 6 
            dialtone = sin(2*pi*770*time/4)+sin(2*pi*1477*time/4);
        case 7 
            dialtone = sin(2*pi*852*time/4)+sin(2*pi*1209*time/4);
        case 8 
            dialtone = sin(2*pi*852*time/4)+sin(2*pi*1336*time/4);
        case 9
            dialtone = sin(2*pi*852*time/4)+sin(2*pi*1477*time/4);
    end
end

