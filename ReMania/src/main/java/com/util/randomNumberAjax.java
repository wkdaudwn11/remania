package com.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;

public final class randomNumberAjax {
	
	public static final String appid = "remania";
	public static final String apikey = "123"; //8552150a38e711e786d20cc47a1fcfae
	public static final String sender = "01080107913";
	
	public String getConfirmNum(String usertel){

		String confirmNumber = "";
		
		//랜덤으로 인증번호 6자리 생성
		for(int i=0; i<6; i++){
			int randomNum = (int)(Math.random() * 10);
			confirmNumber += randomNum;
		}
		
		System.out.println(confirmNumber);
		
		String hostname = "api.bluehouselab.com";
	    String url = "https://"+hostname+"/smscenter/v1.0/sendsms";

	    //밑의 44번 라인이 에러.
	    CredentialsProvider credsProvider = new BasicCredentialsProvider();
	    credsProvider.setCredentials(
	        new AuthScope(hostname, 443, AuthScope.ANY_REALM),
	        new UsernamePasswordCredentials(appid, apikey)
	    );

	    // Create AuthCache instance
	    AuthCache authCache = new BasicAuthCache();
	    authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

	    // Add AuthCache to the execution context
	    HttpClientContext context = HttpClientContext.create();
	    context.setCredentialsProvider(credsProvider);
	    context.setAuthCache(authCache);

	    DefaultHttpClient client = new DefaultHttpClient();

	    try {
	        HttpPost httpPost = new HttpPost(url);
	        httpPost.setHeader("Content-type", "application/json; charset=utf-8");
	        String json = "{\"sender\":\""+sender+"\",\"receivers\":[\""+usertel+"\"],\"content\":\""+"[중고매니아] 인증번호: "+confirmNumber+"\"}";

	        StringEntity se = new StringEntity(json, "UTF-8");
	        httpPost.setEntity(se);

	        HttpResponse httpResponse = client.execute(httpPost, context);
	        System.out.println(httpResponse.getStatusLine().getStatusCode());

	        InputStream inputStream = httpResponse.getEntity().getContent();
	        if(inputStream != null) {
	            BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
	            String line = "";
	            while((line = bufferedReader.readLine()) != null)
	                System.out.println(line);
	            inputStream.close();
	        }
	    } catch (Exception e) {
	        System.err.println("Error: "+e.getLocalizedMessage());
	    } finally {
	        client.getConnectionManager().shutdown();
	    } 
	    
	    return confirmNumber;
	}

}/////////////////////////////////////////////////////////////
