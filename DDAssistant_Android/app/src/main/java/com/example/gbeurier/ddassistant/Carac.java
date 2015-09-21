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
import android.widget.TextView;

import java.util.ArrayList;


public class Carac extends Fragment {

    transient private SharedPreferences settings;
    transient private ArrayList<Carac> caracList = new ArrayList<Carac>();
    transient private ArrayList<Attack> attackList = new ArrayList<Attack>();
    transient private ArrayList<Attack> damageList = new ArrayList<Attack>();

    public int initial_value;
    public int modifier = 0;
    public int globalModifier = 0;
    public int externalModifier = 0;
    public String caracName = "";

    private class ButtonClickListener implements View.OnClickListener {
        private String mKey;

        public ButtonClickListener(String key) {
            mKey = key;
        }

        @Override
        public void onClick(View view) {
            onKeyPressed(mKey);
        }
    }

    public Carac() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_carac, container, false);
        Button add = (Button) view.findViewById(R.id.addA);
        add.setOnClickListener(new ButtonClickListener("add"));
        Button sub = (Button) view.findViewById(R.id.subA);
        sub.setOnClickListener(new ButtonClickListener("sub"));
        Button reset = (Button) view.findViewById(R.id.resetA);
        reset.setOnClickListener(new ButtonClickListener("reset"));
        TextView title = (TextView) view.findViewById(R.id.caracName);
        title.setOnClickListener(new ButtonClickListener("set"));
        return view;
    }

    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        settings = activity.getPreferences(Context.MODE_PRIVATE);
    }

    public void onKeyPressed(String key) {
        if (key == "add") modifier++;
        else if (key == "sub") modifier--;
        else if (key == "reset") modifier = 0;
        else if (key == "set") {
            initial_value = initial_value + modifier;
            modifier = 0;
        }
        display();

        for (Carac c : caracList) {
            if (key == "add")
                c.externalModifier++;
            else if (key == "sub")
                c.externalModifier--;
            else if (key == "reset")
                c.externalModifier = 0;
            c.display();
        }

        for (Attack c : attackList) {
            if (key == "add")
                c.externalAtkModifier++;
            else if (key == "sub")
                c.externalAtkModifier--;
            else if (key == "reset")
                c.externalAtkModifier = 0;
            c.display();
        }

        for (Attack c : damageList) {
            if (key == "add")
                c.externalDmgModifier++;
            else if (key == "sub")
                c.externalDmgModifier--;
            else if (key == "reset")
                c.externalDmgModifier = 0;
            c.display();
        }
    }

    public void display() {
        int value = initial_value + modifier + globalModifier + externalModifier;
        ((TextView) getView().findViewById(R.id.inputValue)).setText(String.valueOf(value));
        if (value > initial_value)
            ((TextView) getView().findViewById(R.id.inputValue)).setTextColor(getResources().getColor(R.color.true_lblue));
        else if (value < initial_value)
            ((TextView) getView().findViewById(R.id.inputValue)).setTextColor(getResources().getColor(R.color.true_lred));
        else
            ((TextView) getView().findViewById(R.id.inputValue)).setTextColor(getResources().getColor(R.color.true_black));

        ((TextView) getView().findViewById(R.id.caracName)).setText(caracName);
    }

    @Override
    public void onStart() {
        super.onStart();
        initial_value = settings.getInt("CARAC_" + caracName + "Value", 0);
        modifier = settings.getInt("CARAC_" + caracName + "Modifier", 0);
        globalModifier = settings.getInt("CARAC_" + caracName + "GlobalModifier", 0);
        externalModifier = settings.getInt("CARAC_" + caracName + "ExternalModifier", 0);
        display();
    }

    @Override
    public void onStop() {
        super.onStop();
        SharedPreferences.Editor editor = settings.edit();
        editor.putInt("CARAC_" + caracName + "Value", initial_value);
        editor.putInt("CARAC_" + caracName + "Modifier", modifier);
        editor.putInt("CARAC_" + caracName + "GlobalModifier", globalModifier);
        editor.putInt("CARAC_" + caracName + "ExternalModifier", externalModifier);
        editor.commit();
    }

    public void addCarac(Carac carac) {
        caracList.add(carac);
    }
    public void addAttack(Attack attack) {
        attackList.add(attack);
    }
    public void addDamage(Attack attack) {
        damageList.add(attack);
    }
}
