package tests;

import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.Gson;


public class TestTimo
{

	/**
	 * @param args
	 */
	// public static void main(String[] args) {
	//
	// String request =
	// "http://api.search.yahoo.com/WebSearchService/V1/webSearch";
	// HttpClient client = new HttpClient();
	//
	// PostMethod method = new PostMethod(request);
	//
	// // Add POST parameters
	//
	// method.addParameter("appid", "YahooDemo");
	//
	// method.addParameter("query", "umbrella");
	//
	// method.addParameter("results", "10");
	//
	// // Send POST request
	//
	// int statusCode = client.executeMethod(method);
	//
	// InputStream rstream = null;
	//
	// // Get the response body
	//
	// rstream = method.getResponseBodyAsStream();
	//
	// }

	// public class SimpleHttpPut {
	// public static void main(String[] args) {
	// HttpClient client = new DefaultHttpClient();
	// HttpPost post = new HttpPost(
	// "http://api.search.yahoo.com/WebSearchService/V1/webSearch");
	// try {
	// List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(
	// 1);
	// nameValuePairs.add(new BasicNameValuePair("registrationid",
	// "123456789"));
	// post.setEntity(new UrlEncodedFormEntity(nameValuePairs));
	//
	// HttpResponse response = client.execute(post);
	// BufferedReader rd = new BufferedReader(new InputStreamReader(
	// response.getEntity().getContent()));
	// String line = "";
	// while ((line = rd.readLine()) != null) {
	// System.out.println(line);
	// }
	//
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// }

	public static void main(String[] args) throws Exception
	{
		for (int b = 0; b < 20; b++)
		{
			String google = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=";
			// String google =
			// "http://www.google.de/webhp?hl=de&tab=ww#hl=de&output=search&sclient=psy-ab&q=hallo&oq=hallo&gs_l=hp.3..0l4.2740.3232.0.3425.5.4.0.1.1.0.127.437.1j3.4.0...0.0...1c.1.6.psy-ab.fikDIeT-yWI&pbx=1&bav=on.2,or.r_qf.&bvm=bv.43828540,d.Yms&fp=a51863cef2c242f1&biw=1400&bih=784"
			String search = "heise" + b;
			String charset = "UTF-8";
			String start = "4";

			URL url = new URL(google + URLEncoder.encode(search, charset));
			Reader reader = new InputStreamReader(url.openStream(), charset);
			GoogleResults results = new Gson().fromJson(reader, GoogleResults.class);

			int counts = results.getResponseData().size();
			System.out.println(counts);

			for (int i = 0; i < counts; i++)
			{
				System.out.println(results.getResponseData().getResults().get(i).toString());
			}
		}

		// System.out.println(results.getResponseData().getResults().toString());
		// Show title and URL of 1st result.
		// System.out.println(results.getResponseData().getResults().get(0)
		// .toString());
		// System.out.println(results.getResponseData().getResults().get(1)
		// .toString());
		// System.out.println(results.getResponseData().getResults().get(2)
		// .toString());
		// System.out.println(results.getResponseData().getResults().get(3)
		// .toString());

	}

	// }

}
