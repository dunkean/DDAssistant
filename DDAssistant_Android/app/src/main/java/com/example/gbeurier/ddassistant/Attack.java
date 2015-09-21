package com.example.gbeurier.ddassistant;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.ArrayList;


public class Attack extends Fragment {

    transient SharedPreferences settings;

    public String attackName;
    public ArrayList<Integer> attacks = new ArrayList<Integer>();
    public int atkModifier = 0;
    public int externalAtkModifier = 0;
    public ArrayList<Integer> damages = new ArrayList<Integer>();
    public int dmgModifier = 0;
    public int externalDmgModifier = 0;

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

    public Attack() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_attack, container, false);
        ((Button) view.findViewById(R.id.addA)).setOnClickListener(new ButtonClickListener("addA"));
        ((Button) view.findViewById(R.id.subA)).setOnClickListener(new ButtonClickListener("subA"));
        ((Button) view.findViewById(R.id.resetA)).setOnClickListener(new ButtonClickListener("resetA"));
        ((Button) view.findViewById(R.id.addAA)).setOnClickListener(new ButtonClickListener("addAA"));
        ((Button) view.findViewById(R.id.subAA)).setOnClickListener(new ButtonClickListener("subAA"));
        ((Button) view.findViewById(R.id.addD)).setOnClickListener(new ButtonClickListener("addD"));
        ((Button) view.findViewById(R.id.subD)).setOnClickListener(new ButtonClickListener("subD"));
        ((Button) view.findViewById(R.id.resetD)).setOnClickListener(new ButtonClickListener("resetD"));
        ((Button) view.findViewById(R.id.launchA)).setOnClickListener(new ButtonClickListener("launchA"));
        ((Button) view.findViewById(R.id.launchD)).setOnClickListener(new ButtonClickListener("launchD"));
        ((Button) view.findViewById(R.id.launchDAll)).setOnClickListener(new ButtonClickListener("launchDAll"));
        ((Button) view.findViewById(R.id.averageD)).setOnClickListener(new ButtonClickListener("averageD"));
        return view;
    }


    public void onKeyPressed(String key) {
        attacks = AttackParser.AttacksTokenize(((EditText) getView().findViewById(R.id.attacks)).getText().toString(), atkModifier, externalAtkModifier);
        damages = AttackParser.DamagesTokenize(((EditText) getView().findViewById(R.id.damages)).getText().toString(), dmgModifier, externalDmgModifier);

        if (key == "launchA") launchAttacks();
        else if (key == "addA") atkModifier++;
        else if (key == "subA") atkModifier--;
        else if (key == "resetA") atkModifier = 0;
        else if (key == "addAA") attacks.add(0, attacks.get(0));
        else if (key == "subAA") attacks.remove(0);
        else if (key == "launchD") launchDamages(false);
        else if (key == "launchDAll") launchDamages(true);
        else if (key == "averageD") launchAverage();
        else if (key == "addD") dmgModifier++;
        else if (key == "subD") dmgModifier--;
        else if (key == "resetD") dmgModifier = 0;

        display();
    }


    public void setIconBackground(String name) {
        if (name == "bow")
            ((TextView) getView().findViewById(R.id.attackTitle)).setBackground(getResources().getDrawable(R.mipmap.bow8));
        else if (name == "1sword")
            ((TextView) getView().findViewById(R.id.attackTitle)).setBackground(getResources().getDrawable(R.mipmap.sword1));
        else if (name == "2swords")
            ((TextView) getView().findViewById(R.id.attackTitle)).setBackground(getResources().getDrawable(R.mipmap.cross6));
    }


    public void launchAttacks() {
        String result = "";
        String dices = "";
        for (int att : attacks) {
            int dice = (int) (Math.random() * 20) + 1;
            dices += "<small><i>" + String.valueOf(dice) + "</i></small>";
            dices += "-";
            if (dice == 20)
                result += "<b><i>" + String.valueOf(dice + att + atkModifier + externalAtkModifier) + "</i></b>";
            else
                result += String.valueOf(dice + att + atkModifier) + externalAtkModifier;
            result += "-";
        }
        result = result.substring(0, result.length() - 1);
        dices = dices.substring(0, dices.length() - 1);
        result += "<br>" + dices;
        ((TextView) getView().findViewById(R.id.attackResult)).setText(Html.fromHtml(result));
    }

    public void launchDamages(boolean all) {
        String result = "";
        int total = 0;
        if (all) {
            int nbAttacks = attacks.size();
            String sumResults = "<small><i>";
            for (int i = 0; i < nbAttacks; i++) {
                int attTotal = 0;
                for (int j = 0; j < damages.size() - 1; j += 2) {
                    attTotal += damages.get(j) * (int) (Math.random() * damages.get(j + 1) + 1);
                }
                attTotal += damages.get(damages.size() - 1) + dmgModifier + externalDmgModifier;
                total += attTotal;
                result += String.valueOf(attTotal);
                result += "+";

                sumResults += String.valueOf(total);
                sumResults += "-";
            }
            result = result.substring(0, result.length() - 1);
            result += " = " + String.valueOf(total);

            sumResults = sumResults.substring(0, sumResults.length() - 1);
            sumResults += "</i></small>";
            result += "<br>";
            result += sumResults;
            ((TextView) getView().findViewById(R.id.damagesResult)).setText(Html.fromHtml(result));
        } else {
            int val;
            for (int j = 0; j < damages.size() - 1; j += 2) {
                val = damages.get(j) * (int) (Math.random() * damages.get(j + 1) + 1);
                total += val;
                result += String.valueOf(val);
                result += "+";
            }
            val = damages.get(damages.size() - 1) + dmgModifier;
            result += String.valueOf(val);
            total += val;
            result += " = " + String.valueOf(total);
            ((TextView) getView().findViewById(R.id.damagesResult)).setText(result);
        }
    }

    public void launchAverage() {
        int val;
        String result = "";
        double total = 0;
        for (int j = 0; j < damages.size() - 1; j += 2) {
            total += new Double(damages.get(j) * (new Double(damages.get(j + 1) + 1) / 2));
        }
        total += damages.get(damages.size() - 1) + dmgModifier;
        result = String.valueOf(Math.round(total));


        int nbAttacks = attacks.size();
        String sumResults = "<small><i>";
        for (int i = 0; i < nbAttacks; i++) {
            sumResults += String.valueOf(total * i);
            sumResults += "-";
        }
        sumResults = sumResults.substring(0, sumResults.length() - 1);
        sumResults += "</i></small>";
        result += "<br>";
        result += sumResults;
        ((TextView) getView().findViewById(R.id.damagesResult)).setText(Html.fromHtml(result));
    }


    public void display() {
        ((EditText) getView().findViewById(R.id.attacks)).setText(AttackParser.AttacksBuild(attacks, atkModifier, externalAtkModifier));

        if (atkModifier + externalAtkModifier > 0)
            ((EditText) getView().findViewById(R.id.attacks)).setTextColor(getResources().getColor(R.color.true_lblue));
        else if (atkModifier + externalAtkModifier < 0)
            ((EditText) getView().findViewById(R.id.attacks)).setTextColor(getResources().getColor(R.color.true_lred));
        else
            ((EditText) getView().findViewById(R.id.attacks)).setTextColor(getResources().getColor(R.color.true_black));


        ((EditText) getView().findViewById(R.id.damages)).setText(AttackParser.DamagesBuild(damages, dmgModifier, externalDmgModifier));

        if (dmgModifier + externalDmgModifier > 0)
            ((EditText) getView().findViewById(R.id.damages)).setTextColor(getResources().getColor(R.color.true_lblue));
        else if (dmgModifier + externalDmgModifier < 0)
            ((EditText) getView().findViewById(R.id.damages)).setTextColor(getResources().getColor(R.color.true_lred));
        else
            ((EditText) getView().findViewById(R.id.damages)).setTextColor(getResources().getColor(R.color.true_black));
    }

    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        settings = activity.getPreferences(Context.MODE_PRIVATE);
    }

    @Override
    public void onStart() {
        super.onStart();
        attacks = AttackParser.AttacksDeSerialize(settings.getString("ATTACK_" + attackName + "Values", ""));
        atkModifier = settings.getInt("ATTACK_" + attackName + "Modifier", 0);
        externalAtkModifier = settings.getInt("ATTACK_" + attackName + "ExternalModifier", 0);
        damages = AttackParser.DamagesDeSerialize(settings.getString("DAMAGES_" + attackName + "Values", ""));
        dmgModifier = settings.getInt("DAMAGES_" + attackName + "Modifier", 0);
        externalDmgModifier = settings.getInt("DAMAGES_" + attackName + "ExternalModifier", 0);
        display();
    }

    @Override
    public void onStop() {
        super.onStop();
        SharedPreferences.Editor editor = settings.edit();
        editor.putString("ATTACK_" + attackName + "Values", AttackParser.AttacksSerialize(attacks));
        editor.putInt("ATTACK_" + attackName + "GlobalModifier", atkModifier);
        editor.putInt("ATTACK_" + attackName + "ExternalModifier", externalAtkModifier);
        editor.putString("DAMAGES_" + attackName + "Values", AttackParser.DamagesSerialize(damages));
        editor.putInt("DAMAGES_" + attackName + "GlobalModifier", dmgModifier);
        editor.putInt("DAMAGES_" + attackName + "ExternalModifier", externalDmgModifier);
        editor.commit();
    }

}
