<%@page pageEncoding="utf-8" import="com.systex.counter.*"%><%

	public SerialCounter getApplactionSerialCounter(String nameCounter, long aliveTime){
		Cache cache = getApplicationCache();
		String cacheName = "Counter:"+nameCounter;
		SerialCounter counter = (SerialCounter)cache.get(cacheName);
		if(counter == null){
			synchronized (SerialCounter.class) {
				counter = (SerialCounter)cache.get(cacheName);
				if(counter == null){
					counter = new SerialCounter();
					cache.put(cacheName, counter, aliveTime);
				}
			}
		}
		return counter;
	}
	//sample#1:
	//SerialCounter counter = getApplactionSerialCounter("AAA", 60000); //60000ms重置
	//int thisCount = counter.getThisCount();
	//int nextCount = counter.getNextCount();
%>