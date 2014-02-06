function ps2q2()

close all; clc;

%Read in image files
[x1, x2, pts3d] = readTextFiles();
x1=x1(1:2,:);
x2=x2(1:2,:);


%%% YOUR CODE HERE %%%

% finds the centroid of x1 and x2
centroid1 = [0 0];
for i = 1 : 2
  for j = 1 : size(x1)(2);
    centroid1(i) = centroid1(i) + x1(i,j);
  end
  centroid1(i) = centroid1(i)/size(x1)(2);
end

centroid2 = [0 0];
for i = 1 : 2
  for j = 1 : size(x2)(2);
    centroid2(i) = centroid2(i) + x2(i,j);
  end
  centroid2(i) = centroid2(i)/size(x2)(2);
end
%finds the centered data 
x1centered = x1;
 for i = 1 : 2
  for j = 1 : size(x1)(2)
    x1centered(i,j) = x1centered(i,j) - centroid1(i);
  end
end
%finds the centered data 
 x2centered = x2;
 for i = 1 : 2
  for j = 1 : size(x2)(2)
    x2centered(i,j) = x2centered(i,j) - centroid2(i);
  end
end
disp(size(x2));
% initializes the measurement matrix to the centered data
measurement = zeros(size(x2)(2), 4);
for i = 1 : 2
  for j = 1 : size(x2)(2)
    measurement(j,i) = x1centered(i, j);
    measurement(j,i+2) = x2centered(i,j);
  end
end
% performs svd on the measurement matrix, and trims to what we want
[U S V] = svd(transpose(measurement));
VT = transpose(V);
U3 = U(:,1:3);
S3 = S(1:3,1:3);
V3 = VT(1:3,:);
% nicer names
motion = U3;
structure = S3*V3;
% the ground truth plot
plot3(pts3d(1,:),pts3d(2,:),pts3d(3,:),'.');
axis equal;
title("Ground truth");
% plot of the data we just generated. we see that there's just scaling and rotation off.
plot3(structure(1,:),structure(2,:),structure(3,:),'.');
axis equal;
title("Structure");

%%% END YOUR CODE HERE %%%

end

  
