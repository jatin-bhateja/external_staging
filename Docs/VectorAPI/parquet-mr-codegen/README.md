# libraries.databases.thirdparty.parquet-mr
### Bitpack algorithm is very popular in database and big data storage system like Parquet, ORC. Vector API optimization provide better performance for en/decoding bitpack.
### Below are performance impovement reports

![image](https://github.com/intel-innersource/libraries.databases.thirdparty.parquet-mr/assets/90173364/a79a25e0-2d42-4c6e-8385-a4c7dfe5d955)
![image](https://github.com/intel-innersource/libraries.databases.thirdparty.parquet-mr/assets/90173364/4e5d2b61-283b-4b29-b0d8-eb80ce0e6d74)
![image](https://github.com/intel-innersource/libraries.databases.thirdparty.parquet-mr/assets/90173364/58a598a7-c13b-42c8-a1aa-a06205def0d4)
![image](https://github.com/intel-innersource/libraries.databases.thirdparty.parquet-mr/assets/90173364/88e272ba-bfcb-47b5-9255-1bc46b2be950)
### Test sql query in Spark3.3.0 with OpenJDK17，the bitpack optimization improved sql query by 2x~3x in some special case (deep scan file cases)
![image](https://github.com/intel-innersource/libraries.databases.thirdparty.parquet-mr/assets/90173364/dcbf986a-3c37-46c0-9257-61e8f486f257)
![image](https://github.com/intel-innersource/libraries.databases.thirdparty.parquet-mr/assets/90173364/bb8ddcd8-1103-43cf-a115-0187ef538c2f)
select count(*) from ParquetTable where int32_field > 100 order by int32_field 30% performance could be seen
![image](https://github.com/intel-innersource/libraries.databases.thirdparty.parquet-mr/assets/90173364/4c6d81bb-9d94-43a8-9e6d-c60e965c093b)
![image](https://github.com/intel-innersource/libraries.databases.thirdparty.parquet-mr/assets/90173364/d982dc62-9336-4459-a663-fa039e82050b)


