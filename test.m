#disp("K-st nerivnostey?");
#n = input("");
n = 4;
m = n + 2;

nuli = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

koef = nuli(1:2);

C = nuli(1:m);

b = nuli(1:n);

temp_b = nuli(1:n);

d = nuli(1:m);

temp = nuli(1:n);

fin = nuli(1:2);

#disp("Vasha matr A (e. g. [x1 x2 b; x1 x2 b; ...");
#A = input("");

A = [8 -5 40; -2 -5 -10; -6 5 60; 2 1 14];
temp_A = zeros(n, m);

#disp("Koef. pry x1 ta x2 f-cii F?")
#F(1) = input("x1: ");
#F(2) = input("x2: ");
koef(1) = 2;
koef(2) = 6;

C(1) = koef(1);
C(2) = koef(2);

#temp vidpov za C bazisne
temp = C(3:m);

#distayemo b z matr A
for i = 1 : 1 : n
  b(i) = A(i,n-1);
endfor

#kanon. vihlyad
for i = 1 : 1 : n
  for j = 1 : 1 : m
    if j > 2 && j == i+2
      A(i,j) = 1;
    endif
    if j > 2 && j != i+2
        A(i,j) = 0;   
    endif
  endfor
endfor

A
#doky d maye vidyemni znachennia - prodovzhujemo
while true
  sum = 0;
  for j = 1 : m
    for i = 1 : 1 : n
      sum = sum + temp(i)*A(i,j);
    endfor
    d(j) = sum - C(j);
    sum = 0;
  endfor

  stp = 0;
  #shuckayemo min znach d, zapamiatov. stovpchick
  min = 100;
  for i = 1 : m
    if min > d(i)
      min = d(i);
      stp = i;
    endif
  endfor
  #if min nevidyemne -> vyhid
  if(min >= 0)
       break;
  endif
  minb = 100;
  riad = 0;
  #shuckayemo minimalne b/a(i,j) , zapamiatov. riadok
  for i = 1 : n
    tmp = b(i)/A(i, stp);
    if tmp > 0 && tmp < minb
      minb = tmp;
      riad = i;
    endif
  endfor

  temp_b(riad) = b(riad) / A(riad,stp); 
  for i = 1 : m
     temp_A(riad,i) = A(riad,i) / A(riad, stp);
  endfor

  for i = 1 : n
    for j = 1 : m
      if i != riad
        temp_A(i,j) = A(i,j) - (A(riad,j) / A(riad, stp) * A(i, stp));
      endif
    endfor
  endfor

  for i = 1 : n
    if i != riad
      temp_b(i) = b(i) - (b(riad)/A(riad,stp)*A(i,stp));
    endif
  endfor
  
  temp(riad) = C(stp);
  A = temp_A;
  b = temp_b;
  switch (stp)
    case {1, 2}
      fin(stp) = riad;
  endswitch      
endwhile

A

disp("Finalni resultaty:\n");
x1 = b(fin(1))
x2 = b(fin(2))
disp("i resultat f-cii: ");
F = koef(1)*b(fin(1)) + koef(2) * b(fin(2))

