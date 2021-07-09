fb=[9 5 6 7 1 0 10];
z=fb(1);
 z=fb(1);
    for i=2:7
        if z<fb(i)
            j=i;    %index of worst point
        end
    end
    j

% for i=2:7
%     if z>fb(i)
%         k=i;    %index of best point
%     end
%     if z<fb(i)
%         j=i;    %index of worst point
%     end
% end
% k
% j

% % xl=fb(1);
% % xg=fb(1);
% % xl
% % xg
% % for i=2:7
% %     if xl>fb(i)
% %         xl=fb(i);
% %     end
% %     if xg<fb(i)
% %         xg=fb(i);
% %     end
% % end
% % xl
% % xg
% i=0;
% j=1;
% for i=0:5
%     for j=1:6
%         if fb(j) > fb(j+1)
%            var = fb(j);
%            fb(j) = fb(j+1);
%            fb(j+1) = var;
%         end
%     end
% end
% fb