#include "emon_api.h"
int main () {
	EMON_DATA emon_counting_data, emon_metric_data;
	EMONConfig("emon_api_config_file.xml");
	EMONStart();
	// Code segment which for EMON collection
	EMONReadCounts(&emon_counting_data); // get raw data snapshot
	EMONReadMetric(&emon_metric_data); // get metrics snapshot
	// Print All entried in emon_data
	EMONDataPrintAll(emon_counting_data);
	EMONDataPrintAll(emon_metric_data);
	return EMONStop();
}
