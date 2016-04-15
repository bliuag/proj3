function addDataPoint( x,y )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global dataType;
global paraPointsx;
global paraPointsy;
global paraPointsz;
global paraLinesx;
global paraLinesy;
global paraLinesz;
global direction;
global origin;
global rpoints;
global hpoint;
switch dataType
    case 1    
        switch(direction)
            case 'x'
                paraPointsx=[paraPointsx;[x,y]];
                n=size(paraPointsx,1);
                if mod(n,2)==0
                    p1=double([paraPointsx(n,:),1]);
                    p2=double([paraPointsx(n-1,:),1]);
                    l=cross(p1,p2);
                    l=l./l(3);
                    paraLinesx=[paraLinesx;l];
                end
            case 'y'
                paraPointsy=[paraPointsy;[x,y]]; 
                n=size(paraPointsy,1);
                if mod(n,2)==0
                    p1=double([paraPointsy(n,:),1]);
                    p2=double([paraPointsy(n-1,:),1]);
                    l=cross(p1,p2);
                    l=l./l(3);
                    paraLinesy=[paraLinesy;l];
                end
            case 'z'
                paraPointsz=[paraPointsz;[x,y]];
                n=size(paraPointsz,1);
                if mod(n,2)==0
                    p1=double([paraPointsz(n,:),1]);
                    p2=double([paraPointsz(n-1,:),1]);
                    l=cross(p1,p2);
                    l=l./l(3);
                    paraLinesz=[paraLinesz;l];
                end
        end    
        
    case 2
        [n,~]=size(origin);
        if(n==0)
            origin=[x,y];
        end
        updateInfo();
    case 3
        prompt = {'Enter X:','Enter Y:','Enter Z'};
        dlg_title = 'Input';
        num_lines = 1;
        defaultans = {'0','0','0'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
        rpoints=[rpoints;x y str2num(answer{1}) str2num(answer{2}) str2num(answer{3})];
        updateInfo();
    case 4
        if size(hpoint,1)==0
            prompt = {'Enter X:','Enter Y:','Enter Z'};
            dlg_title = 'Input';
            num_lines = 1;
            defaultans = {'0','0','0'};
            answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
            hpoint=[hpoint;x y str2num(answer{1}) str2num(answer{2}) str2num(answer{3})];
            updateInfo();
        end
end
updatePicture();
end

