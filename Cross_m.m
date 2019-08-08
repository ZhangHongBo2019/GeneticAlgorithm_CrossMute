%% 多点交叉
function child=recombine_mp(chromosome,px)
[N,V]=size(chromosome);
child=chromosome;
i=1;
while i<N
    temp1=[];
    temp2=[];
    if rand <= px
        select=randperm(V,4);
        child(i,[select(1),select(2),select(3),select(4)])=chromosome(i+1,[select(1),select(2),select(3),select(4)]);
        child(i+1,[select(1),select(2),select(3),select(4)])=chromosome(i,[select(1),select(2),select(3),select(4)]);
        temp1=NONLCON_1(child(i,:));
        temp2=NONLCON_1(child(i+1,:));
    end
    if ~isempty(temp1)&& ~isempty(temp2)                                      %如果得到的不是可行解，则重新生成
       i=i+2; 
    end
end
