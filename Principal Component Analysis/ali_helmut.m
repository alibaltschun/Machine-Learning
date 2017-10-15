 [X y] = loadmnist( 1000 );
 visual(X(1:100,:));
 Xi = X;
 B  = X';
 rataRata = mean(Xi);
CovMatrixC = cov(Xi);
 [VectC NilaiC] = eig(CovMatrixC);
 VectCDesc = [];
 nilaiCDesc = [];
 for i= 1 : 784
     nilaiCDesc = [ nilaiCDesc ; NilaiC(785-i,785-i)];
     a = []
     for j = 1 : 784
         a = [ a VectC(j,785-i)];
     end
     VectCDesc = [ VectCDesc ; a];
 end
 Vrow = VectCDesc(1:64,:);

 % PCADomain = Vrow * B;
 
 visual(Vrow(1:64,:));

 DomainAsli = Vrow' * PCADomain;
 DomainAsli = DomainAsli';
 % visual(DomainAsli(1:100,:));
 a = 0;
 for i=1 : 64
     a = a + nilaiCDesc(i);
 end
 b = 0;
for i=1 : 784
    b = b + nilaiCDesc(i);
end
 
 nilaiHasilRekontruksi = (a/b) * 100;

 nilaiHasilRekontruksi2 = [];
 for i = 1 : 784
     a = 0;
     for j = 1 : i
         a = a + nilaiCDesc(j);
     end
     c = (a/b) * 100;
     nilaiHasilRekontruksi2 = [nilaiHasilRekontruksi2; c];
 end
 plot(nilaiHasilRekontruksi2);
 X = X';
missRate = [];
 for i=1 : 40
    Vrow                = VectCDesc(1:i*5,:);
    PCADomain           = Vrow * B;
    PCADomain           = PCADomain';
    hasilClasifikasi    = [];  
    a = 0;
      for j = 1 : 1000
        
        jarak = [];
        for k = 1 : 1000
            jarak = [jarak; norm(PCADomain(j,:) - PCADomain(k,:)),y(k)];
        end
        
        jarak             = sortrows(jarak,1);     
        hasilClasifikasi  = [ hasilClasifikasi; mode(jarak(1:15,2)) ];
        a                 = a + (hasilClasifikasi(j) ~= y(j));
      end

      missRate = [ missRate;  a/ 1000 ];
 end

plot(missRate);


