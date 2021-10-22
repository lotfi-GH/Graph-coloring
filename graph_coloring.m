clear all
clc
z=[ 0 1 1 1;
    1 0 1 1;     %INITIALISATION 
    1 1 0 1; 
    1 1 1 0 ] 
[a,b]=size(z)

bg=biograph(z);
set(bg,'ShowArrows','off');
h=view(bg);
set(h.Nodes,'shape','circle');
set(h.Edges,'LineColor',[0 0.75 1]);
k=2 % nombre de couleurs 
t=zeros(a)%contient les couleurs
e=zeros(1,a)%contient les couleurs
ind=1


conflit=zeros(1,a)%contient les conflits 


%******************SELECTION ET  CALCULE DES CONFLITS****************
for g=1:a
for i=1:a
    e(i)=randi(k)
end   

for f=1:a
    
 
c=0

for i=1:a
   for j=1:a
       
       if z(i,j)==1
         
           if e(i)==e(j)
               c=c+1
           end
          
           
       end
   end
 
end


conflit(g)=round(c/2)



end

  for j=1:a
        t(ind,j)=e(j)
  end
    ind=ind+1
end


%**********************CROISEMENT*************************
for x=1:5
[m,p1]=min(conflit)
re=m
conflit(p1)=99

[n,p2]=min(conflit)
e1=zeros(1,4)
e2=zeros(1,4)
mut=zeros(1,2)
conflit(p1)=m

for j=1:a
     e1(j)=t(p1,j)
     e2(j)=t(p2,j)
end
  



 for i=1:2
     mut(i)=e1(i)
     e1(i)=e2(i+2)
     e2(i+2)=mut(i)
      mut(i)=e2(i)
      e2(i)=e1(i+2)
 end
for j=1:a
   t(p1,j)=e1(j)
    t(p2,j)=e2(j)
end



%*********************MUTATION**************************


i=randi(a)
j=randi(a)

for l=1:a
    at=t(l,i)
    t(l,i)=t(l,j)
    t(l,j)=at
end

%*********************EVALUATION************************
ind=1
ind2=1
for g=1:a
for i=1:a
    e(i)=t(ind2,i)
end   
ind2=ind2+1
for f=1:4
    
 
c=0

for i=1:a
   for j=1:a
       if z(i,j)==1
         
           if e(i)==e(j)
               c=c+1
           end
          
           
       end
   end
 
end


conflit(g)=round(c/2)



end

  for j=1:a
        t(ind,j)=e(j)
  end
    ind=ind+1
end

end

%*************APPLICATION DE LA COLORATION*******************

 [m,p]=min(conflit)
 for i=1:4
    e(i)=t(p,i)
 end
 min_conflit=min(conflit)
for i=1:a
    if e(i)==1
    set(h.nodes(i),'color',[1 0 0])
    end
if e(i)==2
    set(h.nodes(i),'color',[0 0.5 1])
   end 
if e(i)==3
    set(h.nodes(i),'color',[0 1 0])
end    
if e(i)==4
    set(h.nodes(i),'color',[1 1 0])
    
end
 if e(i)==5
    set(h.nodes(i),'color',[0.5 0 0])
    end
if e(i)==6
    set(h.nodes(i),'color',[1 0.5 1])
   end 
if e(i)==7
    set(h.nodes(i),'color',[0 0.5 0])
end    
if e(i)==8
    set(h.nodes(i),'color',[1 1 0.5])
    
end

if e(i)==9
    set(h.nodes(i),'color',[0.5 0 0.3])
    end
if e(i)==10
    set(h.nodes(i),'color',[1 0.5 0.2])
   end 
if e(i)==11
    set(h.nodes(i),'color',[0.6 0.5 0.3])
end    
if e(i)==12
    set(h.nodes(i),'color',[1 0.5 0.5])
    
end

end


