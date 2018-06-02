如何画Bonne投影的心形地图
======================
# 导入包
		from pyproj import Proj,transform
		import geopandas
		import seaborn as sns
		from fiona.crs import from_epsg,from_string
		import matplotlib.pyplot as plt
		from geopandas import GeoSeries
		from shapely.geometry import Point
		from shapely.geometry import LineString
		import numpy as np

# 读取shapefile数据
		shp = r'C:\Users\shaoqi_i\Desktop\osgeopy-data\global\ne_110m_admin_0_countries.shp'
		shp_df = geopandas.GeoDataFrame.from_file(shp)

# 设置投影
		ESRI_Bonne = """+proj=bonne +lon_0=0 +lat_1=35"""
		base=shp_df_Bonne.plot(cmap='Set1',k=6,alpha=0.8,edgecolor='black')

# 投影转换，将shapefile的投影转换为Bonne投影
		shp_df_Bonne = shp_df.to_crs(from_string(ESRI_Bonne))

# 画经纬度线
## 投影转换
		p1 = Proj(init='epsg:4326')
		p2= Proj("+proj=bonne +lon_0=0 +lat_1=35")

## 经度 -90~90，步长为30
		for i in range(-90,91,30):
    		lat_Bonne=[]
    		lat=zip(list(np.arange(-180,181)),[i]*361)
    		for j in lat:
				#投影转换
				x,y=transform(p1,p2,j[0],j[1])
				lat_Bonne.append((x,y)) 
		#画线
		x,y=LineString((lat_Bonne)).xy
		base.plot(x,y,linewidth=0.6,color='gray')

## 纬度 -180~180，步长为30
		for i in range(-180,181,30):
    		lon_Bonne=[]
    		lon=zip([i]*181,list(np.arange(-90,91)))
    		for j in lon:
				#投影转换
				x,y=transform(p1,p2,j[0],j[1])
				lon_Bonne.append((x,y))
		#画线
		x,y=LineString((lon_Bonne)).xy
		base.plot(x,y,linewidth=0.6,color='gray')

# 绘图设置
		plt.gca().xaxis.set_major_locator(plt.NullLocator())#去掉x轴刻度
		plt.gca().yaxis.set_major_locator(plt.NullLocator())#去年y轴刻度
		plt.gca().spines['top'].set_visible(False) #去掉上边框
		plt.gca().spines['bottom'].set_visible(False) #去掉下边框
		plt.gca().spines['left'].set_visible(False) #去掉左边框
		plt.gca().spines['right'].set_visible(False) #去掉右边框
		
		#标题字体设置
		font1 = {'family' : 'Times New Roman',  
		'weight' : 'normal',  
		'size'   : 30,  
		}  
		plt.title('''Happy Children's Day!''',fontdict=font1)
		
		#logo
		font1 = {'family' : 'Times New Roman',  
		'weight' : 'normal',  
		'size'   : 16,  
		}  
		plt.text(6000000,-14000000,'            Author: ShaoQi \n NUIST  13RS  Xu YongMing \n   BNU   17GIS   Li 		Jing',fontdict=font1)
		
		#显示
		plt.show()

# 结果如下
![image](https://github.com/ShaoQiBNU/image/blob/master/images/Bonne.png)
				
				
				
