%����ԭʼ�����п��ܳ��ָ�ʽ���󣬽����޳�����Ҫ�۲��ʽ��ȷ��fdata,a,b
%Ҳ�������ڸ�ʽ���������
%cityid='ABQ';%����������  �в�  ��������ī�����ݣ�
%cityid='ABR';%������ �в�  �������ϴ�����ݣ���2013��5��
%cityid='SLE';%����ķ  ����  ���������ո��ݣ�
%cityid='LAX';%��ɼ�  ����  �����������������ݣ�
%cityid='DEN';%����  �в�  ���������������ݣ�
%cityid='HLN';%������  �в�  �������ɴ����ݣ�
%cityid='BIS';%��˹���ݸ���  �в�  ��������������ݣ�
%cityid='TOP';%��Ƥ�����ݸ���  �в�  ����������˹�ݣ�
cityid='DSM';%��÷���ݸ���  �в�  �������°����ݣ�
%cityid='MSP';%���ᰢ����˹  �в�  �����������մ��ݣ�
%cityid='SPI';%˹���ַƶ��£��ݸ���  �в�  ����������ŵ˹�ݣ�
%cityid='LNK';%�ֿϣ��ݸ���  �в�  �������ڲ���˹���ݣ�

%
% city={'HLN'};
% 
% for nn=1:length(city)
    
% cityid=city{nn};

out_dir='D:\�����������\wjc\out\2min_1hour';

if ~isdir([out_dir,'\',cityid])
     mkdir([out_dir,'\',cityid])
end

Vmonth=[];datahourmean=[];
for year=2000:2016
    selectyear=num2str(year);
    if year==2016
        jjj=9;
    else
        jjj=12;
    end       
    
    for jj=1:jjj
        if jj<10
            in_file=['D:\�����������\wjc\1min�������������\',selectyear,'\',cityid,selectyear,'0',num2str(jj),'.dat'];
        else
            in_file=['D:\�����������\wjc\1min�������������\',selectyear,'\',cityid,selectyear,num2str(jj),'.dat'];
        end      
        
        %��ȡ����
        fid=fopen(in_file,'r');
%         %fdata=textscan(fid,'%s %s %s %s %s %s %s %s %s %s %s');%cityid='LAX';%��ɼ�  ����  �����������������ݣ�
%         fdata=textscan(fid,'%s %s %s %s %s %s %s %s %s %s');%cityid='ABQ';%����������  �в�  ��������ī�����ݣ�       
% %         %Ϊ�˽���ʽ����������޳�������c,d,e,f,g,h
%         a=fdata(7);b=fdata(8);c=fdata(9);d=fdata(10);e=fdata(3);f=fdata(4);g=fdata(5);h=fdata(6);
%         data0=[str2double(a{1}) str2double(b{1})];
%         datacd=[str2double(c{1}) str2double(d{1})];
%         dataef=[str2double(e{1}) str2double(f{1})];datagh=[str2double(g{1}) str2double(h{1})];
%         putin=(~isnan(data0(:,1))).*(~isnan(data0(:,2))).*(~isnan(datacd(:,1))).*(~isnan(datacd(:,2))).*(~isnan(dataef(:,1))).*(isnan(dataef(:,2))).*(~isnan(datagh(:,1))).*(isnan(datagh(:,2)));        


        fdata=textscan(fid,'%s %s %s %s %s %s %s %s');%'ABR';%������ �в�  �������ϴ�����ݣ���ʽ��ͬ
        a=fdata(5);b=fdata(6);c=fdata(7);d=fdata(8);e=fdata(3);f=fdata(4);%'ABR';%������ �в�  �������ϴ�����ݣ���ʽ��ͬ
        data0=[str2double(a{1}) str2double(b{1})];
        datacd=[str2double(c{1}) str2double(d{1})];
        dataef=[str2double(e{1}) str2double(f{1})];
        putin=(~isnan(data0(:,1))).*(~isnan(data0(:,2))).*(~isnan(datacd(:,1))).*(~isnan(datacd(:,2))).*(~isnan(dataef(:,1))).*(isnan(dataef(:,2)));  

        data=data0(putin~=0,:);
        A=fdata(2);A=A{1};
        A=A(putin~=0,:);
%%%%%%%%%%%%%%%%%%%%%���У�Ѱ�Ҹ�ʽ����       
        F=zeros(length(A),1);
        for ii=1:length(A)
            F(ii)=length(A{ii});  
        end
%         find(F~=19)%��A�в��Ҷ�Ӧ�е����ڣ���ԭ�ļ��в��Ҵ���
%         disp([selectyear,'\',cityid,selectyear,num2str(jj),'.dat'])
%         erro=A(find(F~=19))%�ҵ���ʽ���������
        A(F~=19)=[];
        data(F~=19,:)=[];
%%%%%%%%%%%%%%%%%%%%%
        exempt=find(data(:,1)<0 | data(:,1)>360 | data(:,2)>70 | data(:,2)<0);
        A(exempt)=[];
        data(exempt,:)=[];
        
        %ȥ��ͻ�������
        data1=data(:,2);
        J1=[data1(1);diff(data1)];
        J2=[-diff(data1);data1(end)];
        rejectthreshord=20;
        data(J1>rejectthreshord & J2>rejectthreshord,:)=[];
        A(J1>rejectthreshord & J2>rejectthreshord)=[];

        B=cell2mat(A);
        B=B(:,4:13);
                
%         A=fdata(2);A=A{1};B=cell2mat(A);
%         B=B(:,4:13);
        time=str2num(B);
        
        %data=cell2mat([fdata(7) fdata(8)]);
        %data=cell2mat([fdata(5) fdata(6)]);%'ABR';%������ �в�  �������ϴ�����ݣ���ʽ��ͬ
        disp(['���ݹ���',num2str(length(A)),'�У�����Ƿ�',selectyear,'\',cityid,selectyear,num2str(jj),'.dat�ļ��е�������ȫ��ȡ'])
         fclose(fid);clear A B a b
         
        %ת��Ϊʸ��
        x=data(:,2).*cos(data(:,1)*pi()/180);
        y=data(:,2).*sin(data(:,1)*pi()/180);
        
        %time1=rem(time,1e4);
        %����Сʱƽ��ֵ
        time1=unique(time);%ԭʼ���ݿ��ܳ���©��ĵ�
        X1=[];Y1=[];
        for ii=1:length(time1)
            x1=mean(x(time==time1(ii)));
            y1=mean(y(time==time1(ii)));
            X1=[X1;x1];
            Y1=[Y1;y1];
        end
        dir=atan2(Y1,X1)*180/pi();
        dir=(dir+360).*(dir<0)+dir.*(dir>=0);%Сʱƽ�����ٷ���
        
        v=(X1.^2+Y1.^2).^0.5*(1852/3600);%Сʱƽ�����٣���ת��Ϊm/s
        
        angle=[0:1:15]'*22.5;
        upangle=angle-22.5/2;upangle(1)=upangle(1)+360;
        downangle=angle+22.5/2;
        dir1=dir;
        for ii=2:16
            dir(dir<downangle(ii) & dir>upangle(ii))=ii;
        end
        dir=dir.*(dir1~=dir)+(dir1==dir);%ʣ�µ���1�����, Сʱƽ�����ٷ���
        
        %%%%%%%%%%%%%%
        
        V=zeros(1,16);
        for ii=1:16
            if sum(v(dir==ii))
                V(ii)=max(v(dir==ii));
            end
        end
        Vmonth=[Vmonth;V];
        v_and_dir=[time1 v dir];
        datahourmean=[datahourmean;v_and_dir];
    end
end

save([out_dir,'\',cityid,'\Vmonth.mat'],'Vmonth')
save([out_dir,'\',cityid,'\datahourmean.mat'],'datahourmean')

% end