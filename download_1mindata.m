%��������ڴ���������ݵ��ļ���
%���������������ִ��뼰������ѡ����еĴ���
%cityid='ABR';%������ �в�  �������ϴ�����ݣ���2013��5��
%cityid='ABE';%���׶�  ����  ��������Ϧ�������ݣ�����������������̨��Ӱ��
%cityid='ABQ';%����������  �в�  ��������ī�����ݣ�
%cityid='LAX';%��ɼ�  ����  �����������������ݣ�
%cityid='SEA';%����ͼ  ����  ��������ʢ���ݣ���ʽ̫��
%cityid='SLE';%����ķ  ����  ���������ո��ݣ�
%cityid='DEN';%����  �в�  ���������������ݣ�
%cityid='HLN';%������  �в�  �������ɴ����ݣ�
%cityid='BIS';%��˹���ݸ���  �в�  ��������������ݣ�
%cityid='TOP';%��Ƥ�����ݸ���  �в�  ����������˹�ݣ�
%cityid='DSM';%��÷���ݸ���  �в�  �������°����ݣ�
%cityid='MSP';%���ᰢ����˹  �в�  �����������մ��ݣ�
%cityid='SPI';%˹���ַƶ��£��ݸ���  �в�  ����������ŵ˹�ݣ�
%cityid='LNK';%�ֿϣ��ݸ���  �в�  �������ڲ���˹���ݣ�
cityid='BWI';%�Ͷ���Ħ  ����  �������������ݣ�������NOAA�����ݶԱ�

disp(cityid)
for year=2001:2015
    selectyear=num2str(year);%ѡ����Ҫ���ص����
    disp(['���ص�',selectyear])
    if ~isdir(selectyear)
        mkdir(selectyear)
    end
    %ftp://ftp.ncdc.noaa.gov/pub/data/asos-onemin/6405-2000/64050KABE200001.dat
    for ii=1:9
        URL=['ftp://ftp.ncdc.noaa.gov/pub/data/asos-onemin/6405-',selectyear,'/64050K',cityid,selectyear,'0',num2str(ii),'.dat'];
        %filename = 'ABE200001.dat';
        filename=[selectyear,'/',cityid,selectyear,'0',num2str(ii),'.dat'];
        outfilename =urlwrite(URL,filename);
    end
    for ii=10:12
        URL=['ftp://ftp.ncdc.noaa.gov/pub/data/asos-onemin/6405-',selectyear,'/64050K',cityid,selectyear,num2str(ii),'.dat'];
        %filename = 'ABE200001.dat';
        filename=[selectyear,'/',cityid,selectyear,num2str(ii),'.dat'];
        outfilename =urlwrite(URL,filename);
    end
end

%2016��ֻ��9��
for year=2016
    selectyear=num2str(year);%ѡ����Ҫ���ص����
    disp(['���ص�',selectyear])
    if ~isdir(selectyear)
        mkdir(selectyear)
    end
    %ftp://ftp.ncdc.noaa.gov/pub/data/asos-onemin/6405-2000/64050KABE200001.dat
    for ii=1:9
        URL=['ftp://ftp.ncdc.noaa.gov/pub/data/asos-onemin/6405-',selectyear,'/64050K',cityid,selectyear,'0',num2str(ii),'.dat'];
        %filename = 'ABE200001.dat';
        filename=[selectyear,'/',cityid,selectyear,'0',num2str(ii),'.dat'];
        outfilename =urlwrite(URL,filename);
    end
end