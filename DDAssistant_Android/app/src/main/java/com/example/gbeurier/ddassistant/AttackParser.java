package com.example.gbeurier.ddassistant;

import java.util.ArrayList;

public class AttackParser {

    public static ArrayList<Integer> AttacksTokenize(String str, int atkModifier, int externalAtkModifier) {
        str = str.replaceAll("\\s", "");
        String[] atts = str.split("/");
        ArrayList<Integer> result = new ArrayList<Integer>();
        if (atts.length > 0)
            for (String att : atts) {
                if (att.isEmpty()) continue;
                else result.add(new Integer(att) - (atkModifier + externalAtkModifier));
            }
        return result;
    }

    public static ArrayList<Integer> DamagesTokenize(String str, int dmgModifier, int externalDmgModifier) {
        str = str.replaceAll("\\s", "");
        String[] dams = str.split("\\+");
        ArrayList<Integer> result = new ArrayList<Integer>();
        int staticDamages = 0;
        for (String dam : dams) {
            String[] ldams = dam.split("D|d");
            if (ldams.length > 1) {
                result.add(new Integer(ldams[0]));
                result.add(new Integer(ldams[1]));
            } else {
                if (ldams[0].isEmpty())
                    staticDamages = 0;
                else
                    staticDamages += new Integer(ldams[0]);
            }
        }
        staticDamages -= (dmgModifier + externalDmgModifier);
        result.add(staticDamages);
        return result;
    }

    public static String AttacksBuild(ArrayList<Integer> attacks, int atkModifier, int externalAtkModifier) {
        String result = "";
        if (attacks.isEmpty())
            return result;

        for (int att : attacks) {
            result += String.valueOf(att + atkModifier + externalAtkModifier) + "/";
        }
        return result.substring(0, result.length() - 1);
    }

    public static String DamagesBuild(ArrayList<Integer> damages, int dmgModifier, int externalDmgModifier) {
        String result = "";
        if (damages.isEmpty())
            return result;

        for (int i = 0; i < damages.size() - 1; i += 2) {
            result += String.valueOf(damages.get(i)) + "D" + String.valueOf(damages.get(i + 1));
            result += "+";
        }
        if (damages.get(damages.size() - 1) != 0 || dmgModifier != 0)
            result += String.valueOf(damages.get(damages.size() - 1) + (dmgModifier + externalDmgModifier));
        else {
            if (!result.isEmpty())
                result = result.substring(0, result.length() - 1);
        }
        return result;
    }

    public static ArrayList<Integer> AttacksDeSerialize(String string) {
        String[] atkStrings = string.split("-");
        ArrayList<Integer> attacks = new ArrayList<Integer>();
        for (String atkStr : atkStrings)
            if(!atkStr.isEmpty())
                attacks.add(new Integer(atkStr));
        return attacks;
    }

    public static ArrayList<Integer> DamagesDeSerialize(String string) {
        String[] dmgStrings = string.split("-");
        ArrayList<Integer> damages = new ArrayList<Integer>();
        for (String dmgStr : dmgStrings)
            if(!dmgStr.isEmpty())
                damages.add(new Integer(dmgStr));
        return damages;
    }

    public static String AttacksSerialize(ArrayList<Integer> attacks) {
        String result = "";
        for (int a : attacks)
            result += "-" + String.valueOf(a);
        return result.substring(1);
    }

    public static String DamagesSerialize(ArrayList<Integer> damages) {
        String result = "";
        for (int a : damages)
            result += "-" + String.valueOf(a);
        return result.substring(1);
    }
}
