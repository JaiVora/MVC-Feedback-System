/*
 * Author: Jai Vora
 * DataProcessor class to process the data, i.e to calculate the mean and standard deviation*/
import java.util.List;

public class DataProcessor {
	public DataBean mean_stD(List<Integer> list) {
		int sum = 0;
		int mean = 0;
		int sD = 0;
		for(int i = 0; i < list.size(); i++) {
			sum += list.get(i);
		}
		mean = sum/list.size();
		for(int j = 0; j < list.size(); j++) {
			int a = (int) (Math.pow(list.get(j) - mean, 2));
			sD = sD + a; 
		}
		int f_sD = (int) Math.sqrt(sD/list.size());
		DataBean a = new DataBean();
		a.setMean(mean);
		a.setstD(f_sD);
		return a;
	}
}
