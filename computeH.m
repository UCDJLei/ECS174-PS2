% computeH
function H = computeH(t1,t2)
    [~,n] = size(t1);
    range = max(max(max(t1)), max(max(t2)));
    % choose the scale based on the maximum number
    for s = 350:50:100
       if 2 >= range / s 
           scale = s;
           break
       end
    end
    
    t1 = t1 / scale;
    t2 = t2 / scale;
    
    % From matrix A and b, and solve x by using least square 
    % A = [2n, 9], b = zeros(2n,1), H = [9,2n]
    
    b = zeros(2*n,1);
    A = zeros(2*n, 9);
    for i = 1:n
        odd = 2*i - 1;
       A(odd,1) = t1(1,i);
       A(odd,2) = t1(2,i);
       A(odd,3) = 1;
       A(odd,7) = -t1(1,i)* t2(1,i);
       A(odd,8) = -t2(1,i)* t1(2,i);
       A(odd,9) = -t2(1,i);
       
       even = 2*i;
       A(even,4) = t1(1,i);
       A(even,5) = t1(2,i);
       A(even,6) = 1;
       A(odd,7) = -t2(2,i)* t1(1,i);
       A(odd,8) = -t2(2,i)* t1(2,i);
       A(odd,9) = -t2(2,i);
    end
    
    h = lsqlin(A,b,[],[]);
    h = h / norm(h);
    
    H = scale * reshape(h,3,3)';
  
end
