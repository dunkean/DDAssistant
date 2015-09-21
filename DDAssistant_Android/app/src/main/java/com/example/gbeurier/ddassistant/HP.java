package com.example.gbeurier.ddassistant;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;


public class HP extends Fragment {

    private class ButtonClickListener implements Button.OnClickListener {
        private String mKey;
        public ButtonClickListener(String key) {
            mKey = key;
        }
        @Override
        public void onClick(View view) {
            onKeyPressed(mKey);
        }
    }

    SharedPreferences settings;

    public HP() {}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_h, container, false);
        ((Button) view.findViewById(R.id.addHP)).setOnClickListener(new ButtonClickListener("addHP"));
        ((Button) view.findViewById(R.id.subHP)).setOnClickListener(new ButtonClickListener("subHP"));
        ((Button) view.findViewById(R.id.resetHP)).setOnClickListener(new ButtonClickListener("resetHP"));
        ((Button) view.findViewById(R.id.fifty)).setOnClickListener(new ButtonClickListener("fifty"));
        ((Button) view.findViewById(R.id.ten)).setOnClickListener(new ButtonClickListener("ten"));
        ((Button) view.findViewById(R.id.five)).setOnClickListener(new ButtonClickListener("five"));
        ((Button) view.findViewById(R.id.addOne)).setOnClickListener(new ButtonClickListener("addOne"));
        ((Button) view.findViewById(R.id.subOne)).setOnClickListener(new ButtonClickListener("subOne"));
        return view;
    }

    public void onKeyPressed(String key) {
        String modStr = ((EditText) getView().findViewById(R.id.currentModif)).getText().toString();
        int initialHP = new Integer(((EditText) getView().findViewById(R.id.initialHP)).getText().toString());
        int currentHP = new Integer(((TextView)getView().findViewById(R.id.currentHP)).getText().toString());
        String historic = ((TextView) getView().findViewById(R.id.historic)).getText().toString();
        int newModif = 0;
        int modif = modStr.isEmpty() ? 0 : new Integer(modStr);

        if (key == "addHP") {
            currentHP += modif;
            if (modif != 0)
                historic += "+" + String.valueOf(modif) + " | ";
        } else if (key == "subHP") {
            currentHP -= modif;
            if (modif != 0)
                historic += "-" + String.valueOf(modif) + " | ";
        } else if (key == "resetHP") {
            currentHP = initialHP;
            historic = "";
        } else if (key == "fifty")
            newModif = modif + 50;
        else if (key == "ten")
            newModif = modif + 10;
        else if (key == "five")
            newModif = modif + 5;
        else if (key == "addOne")
            newModif = modif + 1;
        else if (key == "subOne")
            newModif = modif - 1;

        ((TextView) getView().findViewById(R.id.currentHP)).setText(String.valueOf(currentHP));
        ((EditText) getView().findViewById(R.id.currentModif)).setText(String.valueOf(newModif));
        ((TextView) getView().findViewById(R.id.historic)).setText(historic);
    }



    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        settings = activity.getPreferences(Context.MODE_PRIVATE);
    }

    @Override
    public void onStart() {
        super.onStart();
        ((EditText) getView().findViewById(R.id.initialHP)).setText(settings.getString("initialHp", "0"));
        ((TextView) getView().findViewById(R.id.currentHP)).setText(settings.getString("currentHp", settings.getString("initialHp", "0")));
    }

    @Override
    public void onStop() {
        super.onStop();
        SharedPreferences.Editor editor = settings.edit();
        editor.putString("initialHp", ((EditText) getView().findViewById(R.id.initialHP)).getText().toString());
        editor.putString("currentHp", ((TextView) getView().findViewById(R.id.currentHP)).getText().toString());
        editor.commit();
    }
}
