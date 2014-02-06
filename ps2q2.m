function ps2q2()

close all; clc;

%Read in image files
[x1, x2, pts3d] = readTextFiles();
x1=x1(1:2,:);
x2=x2(1:2,:);

%disp(x1);
%disp(x2);
%disp(pts3d);
%disp(x1(1,:));
%%% YOUR CODE HERE %%%

% finds the centroid of x1 and x2

m = [3 1 1; -1 3 1];




centroid1 = [0 0];
for i = 1 : 2
  for j = 1 : size(x1)(2);
    centroid1(i) = centroid1(i) + x1(i,j);
  end
  centroid1(i) = centroid1(i)/size(x1)(2);
end
%disp(centroid1);

centroid2 = [0 0];
for i = 1 : 2
  for j = 1 : size(x2)(2);
    centroid2(i) = centroid2(i) + x2(i,j);
  end
  centroid2(i) = centroid2(i)/size(x2)(2);
end
%disp(centroid2);
 %finds the centered data 
 x1centered = x1;
 for i = 1 : 2
  for j = 1 : size(x1)(2)
    x1centered(i,j) = x1centered(i,j) - centroid1(i);
  end
end
%disp(x1centered);
 %finds the centered data 
 x2centered = x2;
 for i = 1 : 2
  for j = 1 : size(x2)(2)
    x2centered(i,j) = x2centered(i,j) - centroid2(i);
  end
end
%disp(x2centered);
disp(size(x2));
measurement = zeros(size(x2)(2), 4);
for i = 1 : 2
  for j = 1 : size(x2)(2)
    measurement(j,i) = x1centered(i, j);
    measurement(j,i+2) = x2centered(i,j);
  end
end
%disp("Measurement");
%disp(measurement);
[U S V] = svd(transpose(measurement));
VT = transpose(V);
U3 = U(:,1:3);
%disp("U3");
%disp(U3);
S3 = S(1:3,1:3);
%disp("S3");
%disp(S3);
V3 = VT(1:3,:);
%disp("V");
%disp(V3);
%disp("Product");
%disp(U3*S3*V3);

motion = U3;
structure = S3*V3;

disp(pts3d);
% disp(pts3d(1,:));
plot3(pts3d(1,:),pts3d(2,:),pts3d(3,:),'.');
axis equal;
title("Ground truth");

%plot3(structure(1,:),structure(2,:),structure(3,:),'.');
%axis equal;
%title("Structure");

%%% END YOUR CODE HERE %%%

end

  
