package com.example.gbeurier.ddassistant;

import android.app.Activity;
import android.app.FragmentTransaction;
import android.os.Bundle;

import java.util.Arrays;
import java.util.List;


public class MainActivity extends Activity{

    private Carac mFor = new Carac();
    private Carac mDex = new Carac();
    private Carac mCon = new Carac();
    private Carac mInt = new Carac();
    private Carac mSag = new Carac();
    private Carac mCha = new Carac();
    private Carac mIni = new Carac();
    private Carac mRef = new Carac();
    private Carac mVig = new Carac();
    private Carac mVol = new Carac();
    private Carac mBou = new Carac();
    private Carac mFlat = new Carac();

    private Attack mBow = new Attack();
    private Attack m1HSword = new Attack();
    private Attack m2HSword1 = new Attack();
    private Attack m2HSword2 = new Attack();

    private HP hp = new HP();

    private GroupModifier CAGroup = new GroupModifier();
    private GroupModifier JSGroup = new GroupModifier();

    private List<Carac> caracFragments = Arrays.asList(mFor, mDex, mCon, mInt, mSag, mCha, mIni, mRef, mVig, mVol, mFlat, mBou);
    private List<Integer> caracLayouts = Arrays.asList(R.id.lFor, R.id.lDex, R.id.lCon, R.id.lInt, R.id.lSag, R.id.lCha, R.id.lIni, R.id.lRef, R.id.lVig, R.id.lVol, R.id.lFlat, R.id.lBou);
    private List<String> caracTitles = Arrays.asList("FOR", "DEX", "CON", "INT", "SAG", "CHA", "INI", "REF", "VIG", "VOL", "CAGroup", "BOU");

    private List<Attack> attacksFragments = Arrays.asList(mBow, m1HSword, m2HSword1, m2HSword2);
    private List<Integer> attacksLayouts = Arrays.asList(R.id.LBow, R.id.L1HSword, R.id.L2HSword1, R.id.L2HSword2);
    private List<String> attacksTitles = Arrays.asList("WEAPON1", "WEAPON2", "WEAPON3", "WEAPON4");

    public MainActivity(){
        super();
        for (int i = 0; i < attacksFragments.size(); i++)
            attacksFragments.get(i).attackName = attacksTitles.get(i);

        for (int i = 0; i < caracFragments.size(); i++)
            caracFragments.get(i).caracName = caracTitles.get(i);

        CAGroup.addCarac(mBou);
        CAGroup.addCarac(mFlat);

        JSGroup.addCarac(mRef);
        JSGroup.addCarac(mVig);
        JSGroup.addCarac(mVol);

        mDex.addCarac(mIni);
        mDex.addCarac(mFlat);
        mDex.addCarac(mBou);
        mDex.addAttack(mBow);

        mFor.addAttack(m1HSword);
        mFor.addAttack(m2HSword1);
        mFor.addAttack(m2HSword2);
        mFor.addDamage(mBow);
        mFor.addDamage(m1HSword);
        mFor.addDamage(m2HSword1);
        mFor.addDamage(m2HSword2);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        FragmentTransaction transaction;
        for (int i = 0; i < caracFragments.size(); i++){
            transaction = getFragmentManager().beginTransaction();
            transaction.replace(caracLayouts.get(i), caracFragments.get(i));
            transaction.commit();
        }

        transaction = getFragmentManager().beginTransaction();
        transaction.replace(R.id.lCA, CAGroup);
        transaction.commit();

        transaction = getFragmentManager().beginTransaction();
        transaction.replace(R.id.lJS, JSGroup);
        transaction.commit();

        for (int i = 0; i < attacksFragments.size(); i++){
            transaction = getFragmentManager().beginTransaction();
            transaction.replace(attacksLayouts.get(i), attacksFragments.get(i));
            transaction.commit();
        }

        transaction = getFragmentManager().beginTransaction();
        transaction.replace(R.id.HPLayout, hp);
        transaction.commit();
    }


    @Override
    protected void onStart() {
        super.onStart();

        mBow.setIconBackground("bow");
        m1HSword.setIconBackground("1sword");
        m2HSword1.setIconBackground("2swords");
        m2HSword2.setIconBackground("2swords");
    }


}
