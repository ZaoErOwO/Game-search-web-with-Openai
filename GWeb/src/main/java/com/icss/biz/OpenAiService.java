package com.icss.biz;

import java.io.IOException;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Service
public class OpenAiService {
    private static final String OPENAI_API_KEY = "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";
    private static final String OPENAI_URL = "https://api.openai.com/v1/completions";

    public String getGameName(String prompt) throws IOException {
    	OkHttpClient client = new OkHttpClient();

 
        JSONObject bodyContent = new JSONObject();
        bodyContent.put("model", "text-davinci-003");
        bodyContent.put("prompt", prompt+".Your answer only needs to contain one word which is the first word of the full name of the game that describe in the question.");
        bodyContent.put("temperature", 1);
        bodyContent.put("max_tokens", 50);
        bodyContent.put("top_p", 1);
        bodyContent.put("frequency_penalty", 0);
        bodyContent.put("presence_penalty", 0);

        RequestBody body = RequestBody.create(MediaType.get("application/json; charset=utf-8"), bodyContent.toString());

 
        Request request = new Request.Builder()
            .url(OPENAI_URL)
            .post(body)
            .addHeader("Authorization", "Bearer " + OPENAI_API_KEY)
            .addHeader("Content-Type", "application/json")
            .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected code " + response);
            }


            JSONObject jsonResponse = new JSONObject(response.body().string());
            JSONArray choices = jsonResponse.getJSONArray("choices");
            
                return choices.getJSONObject(0).getString("text").trim();
        }
    }
}

