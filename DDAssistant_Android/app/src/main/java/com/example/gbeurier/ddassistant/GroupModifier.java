package com.example.gbeurier.ddassistant;

import android.os.Bundle;
import android.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import java.util.ArrayList;


public class GroupModifier extends Fragment {

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

    private ArrayList<Carac> caracList = new ArrayList<Carac>();

    public GroupModifier() {}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_group_modifier, container, false);
        Button add = (Button) view.findViewById(R.id.addA);
        add.setOnClickListener(new ButtonClickListener("add"));
        Button sub = (Button) view.findViewById(R.id.subA);
        sub.setOnClickListener(new ButtonClickListener("sub"));
        Button reset = (Button) view.findViewById(R.id.resetA);
        reset.setOnClickListener(new ButtonClickListener("reset"));
        return view;
    }

    public void addCarac(Carac carac) {
        caracList.add(carac);
    }

    public void onKeyPressed(String key) {
        for (Carac c : caracList) {
            if (key == "add")
                c.globalModifier++;
            else if (key == "sub")
                c.globalModifier--;
            else if (key == "reset")
                c.globalModifier = 0;
            c.display();
        }
    }
}
