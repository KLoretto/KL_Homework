

```python
import os
import pandas as pd
import numpy as np

#Import json files
data1 = os.path.join(".", "purchase_data.json")
data2 = os.path.join(".", "purchase_data2.json")

#Read the imported json file
data1_pd = pd.read_json(data1)
data1_pd.head()

#Read the imported json file (when needed remove comments)
#data2_pd = pd.read_csv(data2)
#data2_pd.head()


```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Total Number of Players
Total_Players = data1_pd['SN'].count()
Total_Players
```




    780




```python
#Number of Unique Items
Unique_items = data1_pd['Item Name'].value_counts()
Unique_items
```




    Final Critic                                    14
    Betrayal, Whisper of Grieving Widows            11
    Arcane Gem                                      11
    Stormcaller                                     10
    Trickster                                        9
    Woeful Adamantite Claymore                       9
    Retribution Axe                                  9
    Serenity                                         9
    Conqueror Adamantite Mace                        8
    Bonecarvin Battle Axe                            8
    Splitter, Foe Of Subtlety                        8
    Crucifer                                         8
    Darkheart                                        8
    Crying Steel Sickle                              8
    Torchlight, Bond of Storms                       7
    Persuasion                                       7
    Alpha                                            7
    Victor Iron Spikes                               7
    Feral Katana                                     7
    Blade of the Grave                               7
    Wolf, Promise of the Moonwalker                  7
    Spectral Diamond Doomblade                       7
    Brimstone                                        7
    Alpha, Oath of Zeal                              7
    Darkheart, Butcher of the Champion               7
    Extraction, Quickblade Of Trembling Hands        7
    Blazeguard, Reach of Eternity                    6
    Malificent Bag                                   6
    Celeste                                          6
    Singed Scalpel                                   6
                                                    ..
    Foul Titanium Battle Axe                         2
    Deathraze                                        2
    Warped Fetish                                    2
    Piece Maker                                      2
    Winter's Bite                                    2
    Tranquility, Razor of Black Magic                2
    Worldbreaker                                     2
    Thorn, Conqueror of the Corrupted                2
    Warped Iron Scimitar                             2
    Vindictive Glass Edge                            2
    Yearning Crusher                                 2
    Freak's Bite, Favor of Holy Might                2
    Blazefury, Protector of Delusions                2
    Fusion Pummel                                    2
    Renewed Skeletal Katana                          2
    Oathbreaker, Last Hope of the Breaking Storm     2
    Bloodlord's Fetish                               1
    Downfall, Scalpel Of The Emperor                 1
    Phantomlight                                     1
    Foul Edge                                        1
    Soul-Forged Steel Shortsword                     1
    Hellreaver, Heirloom of Inception                1
    Splinter                                         1
    Verdict                                          1
    Flux, Destroyer of Due Diligence                 1
    Exiled Doomblade                                 1
    Ghastly Adamantite Protector                     1
    Sun Strike, Jaws of Twisted Visions              1
    Exiled Mithril Longsword                         1
    Lightning, Etcher of the King                    1
    Name: Item Name, Length: 179, dtype: int64




```python
#Average Purchase Price
Avg_Price = data1_pd['Price'].mean()
Avg_Price
```




    2.931192307692303




```python
#Total Number of Purchases
Total_Purch = data1_pd['Item Name'].count()
Total_Purch
```




    780




```python
# Total Revenue
Total_Rev = data1_pd['Price'].sum()
Total_Rev
```




    2286.3299999999963




```python
#Gender Demo - Gender Counts
Gender_Count = data1_pd['Gender'].value_counts()
Gender_Count
```




    Male                     633
    Female                   136
    Other / Non-Disclosed     11
    Name: Gender, dtype: int64




```python
#Gender Demo - Gender Percentage
Gender_Percent = Gender_Count / data1_pd['Gender'].count()
Gender_Percent
```




    Male                     0.811538
    Female                   0.174359
    Other / Non-Disclosed    0.014103
    Name: Gender, dtype: float64




```python
#Purchase Analysis - Male Data
Male_data = data1_pd.loc[data1_pd["Gender"].astype(str) == 'Male',:]
Male_data
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
    </tr>
    <tr>
      <th>5</th>
      <td>20</td>
      <td>Male</td>
      <td>10</td>
      <td>Sleepwalker</td>
      <td>1.73</td>
      <td>Tanimnya91</td>
    </tr>
    <tr>
      <th>6</th>
      <td>20</td>
      <td>Male</td>
      <td>153</td>
      <td>Mercenary Sabre</td>
      <td>4.57</td>
      <td>Undjaskla97</td>
    </tr>
    <tr>
      <th>8</th>
      <td>25</td>
      <td>Male</td>
      <td>118</td>
      <td>Ghost Reaver, Longsword of Magic</td>
      <td>2.77</td>
      <td>Sondenasta63</td>
    </tr>
    <tr>
      <th>9</th>
      <td>31</td>
      <td>Male</td>
      <td>99</td>
      <td>Expiration, Warscythe Of Lost Worlds</td>
      <td>4.53</td>
      <td>Hilaerin92</td>
    </tr>
    <tr>
      <th>10</th>
      <td>24</td>
      <td>Male</td>
      <td>57</td>
      <td>Despair, Favor of Due Diligence</td>
      <td>3.81</td>
      <td>Chamosia29</td>
    </tr>
    <tr>
      <th>11</th>
      <td>20</td>
      <td>Male</td>
      <td>47</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>1.55</td>
      <td>Sally64</td>
    </tr>
    <tr>
      <th>12</th>
      <td>30</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Iskossa88</td>
    </tr>
    <tr>
      <th>13</th>
      <td>23</td>
      <td>Male</td>
      <td>77</td>
      <td>Piety, Guardian of Riddles</td>
      <td>3.68</td>
      <td>Seorithstilis90</td>
    </tr>
    <tr>
      <th>14</th>
      <td>40</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Sundast29</td>
    </tr>
    <tr>
      <th>15</th>
      <td>21</td>
      <td>Male</td>
      <td>96</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>4.77</td>
      <td>Haellysu29</td>
    </tr>
    <tr>
      <th>18</th>
      <td>28</td>
      <td>Male</td>
      <td>91</td>
      <td>Celeste</td>
      <td>3.71</td>
      <td>Iskista88</td>
    </tr>
    <tr>
      <th>19</th>
      <td>31</td>
      <td>Male</td>
      <td>177</td>
      <td>Winterthorn, Defender of Shifting Worlds</td>
      <td>4.89</td>
      <td>Assossa43</td>
    </tr>
    <tr>
      <th>20</th>
      <td>24</td>
      <td>Male</td>
      <td>78</td>
      <td>Glimmer, Ender of the Moon</td>
      <td>2.33</td>
      <td>Irith83</td>
    </tr>
    <tr>
      <th>21</th>
      <td>15</td>
      <td>Male</td>
      <td>3</td>
      <td>Phantomlight</td>
      <td>1.79</td>
      <td>Iaralrgue74</td>
    </tr>
    <tr>
      <th>23</th>
      <td>19</td>
      <td>Male</td>
      <td>183</td>
      <td>Dragon's Greatsword</td>
      <td>2.36</td>
      <td>Chanosia65</td>
    </tr>
    <tr>
      <th>24</th>
      <td>11</td>
      <td>Male</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>1.96</td>
      <td>Qarwen67</td>
    </tr>
    <tr>
      <th>25</th>
      <td>21</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Idai61</td>
    </tr>
    <tr>
      <th>26</th>
      <td>29</td>
      <td>Male</td>
      <td>132</td>
      <td>Persuasion</td>
      <td>3.90</td>
      <td>Aerithllora36</td>
    </tr>
    <tr>
      <th>27</th>
      <td>34</td>
      <td>Male</td>
      <td>106</td>
      <td>Crying Steel Sickle</td>
      <td>2.29</td>
      <td>Assastnya25</td>
    </tr>
    <tr>
      <th>28</th>
      <td>15</td>
      <td>Male</td>
      <td>49</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>4.23</td>
      <td>Ilariarin45</td>
    </tr>
    <tr>
      <th>31</th>
      <td>18</td>
      <td>Male</td>
      <td>37</td>
      <td>Shadow Strike, Glory of Ending Hope</td>
      <td>1.93</td>
      <td>Iarilis73</td>
    </tr>
    <tr>
      <th>32</th>
      <td>19</td>
      <td>Male</td>
      <td>48</td>
      <td>Rage, Legacy of the Lone Victor</td>
      <td>4.32</td>
      <td>Malunil62</td>
    </tr>
    <tr>
      <th>33</th>
      <td>24</td>
      <td>Male</td>
      <td>90</td>
      <td>Betrayer</td>
      <td>1.67</td>
      <td>Iskimnya76</td>
    </tr>
    <tr>
      <th>34</th>
      <td>22</td>
      <td>Male</td>
      <td>47</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>1.55</td>
      <td>Yararmol43</td>
    </tr>
    <tr>
      <th>36</th>
      <td>20</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Undare39</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>744</th>
      <td>21</td>
      <td>Male</td>
      <td>130</td>
      <td>Alpha</td>
      <td>1.56</td>
      <td>Ialistidru50</td>
    </tr>
    <tr>
      <th>745</th>
      <td>20</td>
      <td>Male</td>
      <td>79</td>
      <td>Alpha, Oath of Zeal</td>
      <td>2.88</td>
      <td>Sweecossa42</td>
    </tr>
    <tr>
      <th>746</th>
      <td>35</td>
      <td>Male</td>
      <td>34</td>
      <td>Retribution Axe</td>
      <td>4.14</td>
      <td>Ralasti48</td>
    </tr>
    <tr>
      <th>747</th>
      <td>32</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lamon28</td>
    </tr>
    <tr>
      <th>748</th>
      <td>15</td>
      <td>Male</td>
      <td>120</td>
      <td>Agatha</td>
      <td>1.91</td>
      <td>Isri49</td>
    </tr>
    <tr>
      <th>749</th>
      <td>21</td>
      <td>Male</td>
      <td>114</td>
      <td>Yearning Mageblade</td>
      <td>1.79</td>
      <td>Frichassala85</td>
    </tr>
    <tr>
      <th>750</th>
      <td>23</td>
      <td>Male</td>
      <td>86</td>
      <td>Stormfury Lantern</td>
      <td>1.28</td>
      <td>Eollym91</td>
    </tr>
    <tr>
      <th>753</th>
      <td>20</td>
      <td>Male</td>
      <td>4</td>
      <td>Bloodlord's Fetish</td>
      <td>2.28</td>
      <td>Thryallym62</td>
    </tr>
    <tr>
      <th>754</th>
      <td>31</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Sondastan54</td>
    </tr>
    <tr>
      <th>756</th>
      <td>22</td>
      <td>Male</td>
      <td>6</td>
      <td>Rusty Skull</td>
      <td>1.20</td>
      <td>Siasri67</td>
    </tr>
    <tr>
      <th>757</th>
      <td>35</td>
      <td>Male</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Seosri62</td>
    </tr>
    <tr>
      <th>758</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Ryastycal90</td>
    </tr>
    <tr>
      <th>759</th>
      <td>19</td>
      <td>Male</td>
      <td>87</td>
      <td>Deluge, Edge of the West</td>
      <td>2.20</td>
      <td>Chanirrasta87</td>
    </tr>
    <tr>
      <th>760</th>
      <td>29</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Aerithllora36</td>
    </tr>
    <tr>
      <th>761</th>
      <td>28</td>
      <td>Male</td>
      <td>175</td>
      <td>Woeful Adamantite Claymore</td>
      <td>1.24</td>
      <td>Raeduerin33</td>
    </tr>
    <tr>
      <th>762</th>
      <td>36</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lisosiast26</td>
    </tr>
    <tr>
      <th>764</th>
      <td>25</td>
      <td>Male</td>
      <td>70</td>
      <td>Hope's End</td>
      <td>3.89</td>
      <td>Assassasda84</td>
    </tr>
    <tr>
      <th>765</th>
      <td>15</td>
      <td>Male</td>
      <td>13</td>
      <td>Serenity</td>
      <td>1.49</td>
      <td>Aerithnucal56</td>
    </tr>
    <tr>
      <th>767</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Hailaphos89</td>
    </tr>
    <tr>
      <th>768</th>
      <td>21</td>
      <td>Male</td>
      <td>158</td>
      <td>Darkheart, Butcher of the Champion</td>
      <td>3.56</td>
      <td>Chamucosda93</td>
    </tr>
    <tr>
      <th>769</th>
      <td>24</td>
      <td>Male</td>
      <td>73</td>
      <td>Ritual Mace</td>
      <td>3.74</td>
      <td>Frichilsasya78</td>
    </tr>
    <tr>
      <th>770</th>
      <td>22</td>
      <td>Male</td>
      <td>141</td>
      <td>Persuasion</td>
      <td>3.27</td>
      <td>Aenasu69</td>
    </tr>
    <tr>
      <th>771</th>
      <td>24</td>
      <td>Male</td>
      <td>25</td>
      <td>Hero Cane</td>
      <td>1.03</td>
      <td>Lassista97</td>
    </tr>
    <tr>
      <th>772</th>
      <td>15</td>
      <td>Male</td>
      <td>31</td>
      <td>Trickster</td>
      <td>2.07</td>
      <td>Sidap51</td>
    </tr>
    <tr>
      <th>773</th>
      <td>21</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Chamadarsda63</td>
    </tr>
    <tr>
      <th>774</th>
      <td>24</td>
      <td>Male</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Lassassast73</td>
    </tr>
    <tr>
      <th>775</th>
      <td>22</td>
      <td>Male</td>
      <td>98</td>
      <td>Deadline, Voice Of Subtlety</td>
      <td>3.62</td>
      <td>Eural50</td>
    </tr>
    <tr>
      <th>776</th>
      <td>14</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Lirtossa78</td>
    </tr>
    <tr>
      <th>777</th>
      <td>20</td>
      <td>Male</td>
      <td>117</td>
      <td>Heartstriker, Legacy of the Light</td>
      <td>4.15</td>
      <td>Tillyrin30</td>
    </tr>
    <tr>
      <th>778</th>
      <td>20</td>
      <td>Male</td>
      <td>75</td>
      <td>Brutality Ivory Warmace</td>
      <td>1.72</td>
      <td>Quelaton80</td>
    </tr>
  </tbody>
</table>
<p>633 rows × 6 columns</p>
</div>




```python
#Purchase Analysis - Male Purchase Count
Male_data["Item Name"].count()

```




    633




```python
#Purchase Analysis - Male Average Purchase Price
Male_data["Price"].mean()
```




    2.9505213270142154




```python
#Purchase Analysis - Male Total Purchase Value
Male_data["Price"].sum()
```




    1867.6799999999985




```python
#Purchase Analysis - Male Noralized Totals
Male_data["Price"].std()
```




    1.10996659201214




```python
#Purchase Analysis - Female Data
Female_data = data1_pd.loc[data1_pd["Gender"].astype(str) == 'Female',:]
Female_data
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>7</th>
      <td>29</td>
      <td>Female</td>
      <td>169</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>3.32</td>
      <td>Iathenudil29</td>
    </tr>
    <tr>
      <th>16</th>
      <td>22</td>
      <td>Female</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Sundista85</td>
    </tr>
    <tr>
      <th>17</th>
      <td>22</td>
      <td>Female</td>
      <td>59</td>
      <td>Lightning, Etcher of the King</td>
      <td>1.65</td>
      <td>Aenarap34</td>
    </tr>
    <tr>
      <th>22</th>
      <td>11</td>
      <td>Female</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Deural48</td>
    </tr>
    <tr>
      <th>29</th>
      <td>16</td>
      <td>Female</td>
      <td>45</td>
      <td>Glinting Glass Edge</td>
      <td>2.46</td>
      <td>Phaedai25</td>
    </tr>
    <tr>
      <th>30</th>
      <td>21</td>
      <td>Female</td>
      <td>155</td>
      <td>War-Forged Gold Deflector</td>
      <td>3.73</td>
      <td>Eulaeria40</td>
    </tr>
    <tr>
      <th>35</th>
      <td>21</td>
      <td>Female</td>
      <td>13</td>
      <td>Serenity</td>
      <td>1.49</td>
      <td>Aisur51</td>
    </tr>
    <tr>
      <th>41</th>
      <td>19</td>
      <td>Female</td>
      <td>124</td>
      <td>Venom Claymore</td>
      <td>2.72</td>
      <td>Aeral43</td>
    </tr>
    <tr>
      <th>50</th>
      <td>32</td>
      <td>Female</td>
      <td>32</td>
      <td>Orenmir</td>
      <td>4.95</td>
      <td>Saistyphos30</td>
    </tr>
    <tr>
      <th>54</th>
      <td>25</td>
      <td>Female</td>
      <td>101</td>
      <td>Final Critic</td>
      <td>4.62</td>
      <td>Minduli80</td>
    </tr>
    <tr>
      <th>58</th>
      <td>24</td>
      <td>Female</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>1.96</td>
      <td>Tyaeristi78</td>
    </tr>
    <tr>
      <th>62</th>
      <td>19</td>
      <td>Female</td>
      <td>39</td>
      <td>Betrayal, Whisper of Grieving Widows</td>
      <td>2.35</td>
      <td>Aeri84</td>
    </tr>
    <tr>
      <th>70</th>
      <td>7</td>
      <td>Female</td>
      <td>158</td>
      <td>Darkheart, Butcher of the Champion</td>
      <td>3.56</td>
      <td>Eosurdru76</td>
    </tr>
    <tr>
      <th>80</th>
      <td>16</td>
      <td>Female</td>
      <td>128</td>
      <td>Blazeguard, Reach of Eternity</td>
      <td>4.00</td>
      <td>Chanosseya79</td>
    </tr>
    <tr>
      <th>83</th>
      <td>25</td>
      <td>Female</td>
      <td>32</td>
      <td>Orenmir</td>
      <td>4.95</td>
      <td>Frichaststa61</td>
    </tr>
    <tr>
      <th>85</th>
      <td>20</td>
      <td>Female</td>
      <td>150</td>
      <td>Deathraze</td>
      <td>4.54</td>
      <td>Ithergue48</td>
    </tr>
    <tr>
      <th>96</th>
      <td>22</td>
      <td>Female</td>
      <td>54</td>
      <td>Eternal Cleaver</td>
      <td>3.14</td>
      <td>Yasurra52</td>
    </tr>
    <tr>
      <th>97</th>
      <td>17</td>
      <td>Female</td>
      <td>49</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>4.23</td>
      <td>Assassasta79</td>
    </tr>
    <tr>
      <th>106</th>
      <td>37</td>
      <td>Female</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Chadossa56</td>
    </tr>
    <tr>
      <th>109</th>
      <td>20</td>
      <td>Female</td>
      <td>42</td>
      <td>The Decapitator</td>
      <td>4.82</td>
      <td>Lassast89</td>
    </tr>
    <tr>
      <th>110</th>
      <td>20</td>
      <td>Female</td>
      <td>13</td>
      <td>Serenity</td>
      <td>1.49</td>
      <td>Philodil43</td>
    </tr>
    <tr>
      <th>122</th>
      <td>18</td>
      <td>Female</td>
      <td>53</td>
      <td>Vengeance Cleaver</td>
      <td>3.70</td>
      <td>Iliel92</td>
    </tr>
    <tr>
      <th>125</th>
      <td>7</td>
      <td>Female</td>
      <td>10</td>
      <td>Sleepwalker</td>
      <td>1.73</td>
      <td>Heosurnuru52</td>
    </tr>
    <tr>
      <th>127</th>
      <td>23</td>
      <td>Female</td>
      <td>74</td>
      <td>Yearning Crusher</td>
      <td>1.06</td>
      <td>Eyircil84</td>
    </tr>
    <tr>
      <th>129</th>
      <td>23</td>
      <td>Female</td>
      <td>126</td>
      <td>Exiled Mithril Longsword</td>
      <td>3.25</td>
      <td>Eurinu48</td>
    </tr>
    <tr>
      <th>133</th>
      <td>17</td>
      <td>Female</td>
      <td>108</td>
      <td>Extraction, Quickblade Of Trembling Hands</td>
      <td>3.39</td>
      <td>Sundossast30</td>
    </tr>
    <tr>
      <th>137</th>
      <td>13</td>
      <td>Female</td>
      <td>20</td>
      <td>Netherbane</td>
      <td>1.48</td>
      <td>Ilosia37</td>
    </tr>
    <tr>
      <th>154</th>
      <td>27</td>
      <td>Female</td>
      <td>39</td>
      <td>Betrayal, Whisper of Grieving Widows</td>
      <td>2.35</td>
      <td>Lassilsa41</td>
    </tr>
    <tr>
      <th>156</th>
      <td>17</td>
      <td>Female</td>
      <td>27</td>
      <td>Riddle, Tribute of Ended Dreams</td>
      <td>3.96</td>
      <td>Marim28</td>
    </tr>
    <tr>
      <th>158</th>
      <td>25</td>
      <td>Female</td>
      <td>66</td>
      <td>Victor Iron Spikes</td>
      <td>3.55</td>
      <td>Eodailis27</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>616</th>
      <td>20</td>
      <td>Female</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Reuthelis39</td>
    </tr>
    <tr>
      <th>620</th>
      <td>20</td>
      <td>Female</td>
      <td>80</td>
      <td>Dreamsong</td>
      <td>3.81</td>
      <td>Jiskilsa35</td>
    </tr>
    <tr>
      <th>623</th>
      <td>39</td>
      <td>Female</td>
      <td>161</td>
      <td>Devine</td>
      <td>1.45</td>
      <td>Mindimnya67</td>
    </tr>
    <tr>
      <th>624</th>
      <td>37</td>
      <td>Female</td>
      <td>95</td>
      <td>Singed Onyx Warscythe</td>
      <td>1.03</td>
      <td>Tridaira71</td>
    </tr>
    <tr>
      <th>645</th>
      <td>20</td>
      <td>Female</td>
      <td>103</td>
      <td>Singed Scalpel</td>
      <td>4.87</td>
      <td>Anallorgue57</td>
    </tr>
    <tr>
      <th>651</th>
      <td>30</td>
      <td>Female</td>
      <td>79</td>
      <td>Alpha, Oath of Zeal</td>
      <td>2.88</td>
      <td>Seuthelis34</td>
    </tr>
    <tr>
      <th>652</th>
      <td>21</td>
      <td>Female</td>
      <td>8</td>
      <td>Purgatory, Gem of Regret</td>
      <td>3.91</td>
      <td>Styaduen40</td>
    </tr>
    <tr>
      <th>656</th>
      <td>10</td>
      <td>Female</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Ilaststa70</td>
    </tr>
    <tr>
      <th>664</th>
      <td>22</td>
      <td>Female</td>
      <td>33</td>
      <td>Curved Axe</td>
      <td>1.35</td>
      <td>Sundaststa26</td>
    </tr>
    <tr>
      <th>678</th>
      <td>26</td>
      <td>Female</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>1.96</td>
      <td>Rithe77</td>
    </tr>
    <tr>
      <th>680</th>
      <td>13</td>
      <td>Female</td>
      <td>18</td>
      <td>Torchlight, Bond of Storms</td>
      <td>1.77</td>
      <td>Chanosiast43</td>
    </tr>
    <tr>
      <th>681</th>
      <td>20</td>
      <td>Female</td>
      <td>100</td>
      <td>Blindscythe</td>
      <td>3.66</td>
      <td>Sundim98</td>
    </tr>
    <tr>
      <th>684</th>
      <td>29</td>
      <td>Female</td>
      <td>130</td>
      <td>Alpha</td>
      <td>1.56</td>
      <td>Iathenudil29</td>
    </tr>
    <tr>
      <th>685</th>
      <td>7</td>
      <td>Female</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Lisirra55</td>
    </tr>
    <tr>
      <th>687</th>
      <td>15</td>
      <td>Female</td>
      <td>112</td>
      <td>Worldbreaker</td>
      <td>3.29</td>
      <td>Crausirra42</td>
    </tr>
    <tr>
      <th>689</th>
      <td>16</td>
      <td>Female</td>
      <td>33</td>
      <td>Curved Axe</td>
      <td>1.35</td>
      <td>Eulidru49</td>
    </tr>
    <tr>
      <th>694</th>
      <td>20</td>
      <td>Female</td>
      <td>91</td>
      <td>Celeste</td>
      <td>3.71</td>
      <td>Ririp86</td>
    </tr>
    <tr>
      <th>695</th>
      <td>37</td>
      <td>Female</td>
      <td>117</td>
      <td>Heartstriker, Legacy of the Light</td>
      <td>4.15</td>
      <td>Chadossa56</td>
    </tr>
    <tr>
      <th>710</th>
      <td>27</td>
      <td>Female</td>
      <td>67</td>
      <td>Celeste, Incarnation of the Corrupted</td>
      <td>2.31</td>
      <td>Tyaelorgue39</td>
    </tr>
    <tr>
      <th>718</th>
      <td>22</td>
      <td>Female</td>
      <td>79</td>
      <td>Alpha, Oath of Zeal</td>
      <td>2.88</td>
      <td>Phially37</td>
    </tr>
    <tr>
      <th>724</th>
      <td>13</td>
      <td>Female</td>
      <td>117</td>
      <td>Heartstriker, Legacy of the Light</td>
      <td>4.15</td>
      <td>Chanosiast43</td>
    </tr>
    <tr>
      <th>730</th>
      <td>10</td>
      <td>Female</td>
      <td>148</td>
      <td>Warmonger, Gift of Suffering's End</td>
      <td>3.96</td>
      <td>Hiadanurin36</td>
    </tr>
    <tr>
      <th>731</th>
      <td>20</td>
      <td>Female</td>
      <td>106</td>
      <td>Crying Steel Sickle</td>
      <td>2.29</td>
      <td>Tyaelly53</td>
    </tr>
    <tr>
      <th>732</th>
      <td>23</td>
      <td>Female</td>
      <td>37</td>
      <td>Shadow Strike, Glory of Ending Hope</td>
      <td>1.93</td>
      <td>Shidai42</td>
    </tr>
    <tr>
      <th>739</th>
      <td>35</td>
      <td>Female</td>
      <td>93</td>
      <td>Apocalyptic Battlescythe</td>
      <td>3.91</td>
      <td>Cosadar58</td>
    </tr>
    <tr>
      <th>751</th>
      <td>26</td>
      <td>Female</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>1.88</td>
      <td>Lisjasksda68</td>
    </tr>
    <tr>
      <th>752</th>
      <td>15</td>
      <td>Female</td>
      <td>116</td>
      <td>Renewed Skeletal Katana</td>
      <td>2.37</td>
      <td>Yalostiphos68</td>
    </tr>
    <tr>
      <th>755</th>
      <td>22</td>
      <td>Female</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>1.88</td>
      <td>Ailaesuir66</td>
    </tr>
    <tr>
      <th>766</th>
      <td>22</td>
      <td>Female</td>
      <td>84</td>
      <td>Arcane Gem</td>
      <td>2.23</td>
      <td>Nitherian58</td>
    </tr>
    <tr>
      <th>779</th>
      <td>23</td>
      <td>Female</td>
      <td>107</td>
      <td>Splitter, Foe Of Subtlety</td>
      <td>3.61</td>
      <td>Alim85</td>
    </tr>
  </tbody>
</table>
<p>136 rows × 6 columns</p>
</div>




```python
#Purchase Analysis - Female Purchase Count
Female_data["Item Name"].count()

```




    136




```python
#Purchase Analysis - Female Average Purchase Price
Female_data["Price"].mean()
```




    2.815514705882352




```python
#Purchase Analysis - Female Total Purchase Value
Female_data["Price"].sum()
```




    382.90999999999985




```python
#Purchase Analysis - Female Noralized Totals
Female_data["Price"].std()
```




    1.1510271225384623




```python
#Age Demographics 
data1_pd["Age"].describe()


```




    count    780.000000
    mean      22.729487
    std        6.930604
    min        7.000000
    25%       19.000000
    50%       22.000000
    75%       25.000000
    max       45.000000
    Name: Age, dtype: float64




```python
#Create DataFrame
data1_df = pd.DataFrame(data1_pd)

# Create the bins in which Data will be held
# Bins are (< 10, 10-14, 15-19, 20-24, 25-29, 30-34,35-39, >45)
bins = [0, 9, 14, 19, 24, 29, 34, 39, 100]

groups = ['< 10', '10-14', '15-19', '20-24', '25-29', '30-34','35-39', '>45']

# Place the Ages into bins
pd.cut(data1_df["Age"], bins, labels = groups)


```




    0      35-39
    1      20-24
    2      30-34
    3      20-24
    4      20-24
    5      20-24
    6      20-24
    7      25-29
    8      25-29
    9      30-34
    10     20-24
    11     20-24
    12     30-34
    13     20-24
    14       >45
    15     20-24
    16     20-24
    17     20-24
    18     25-29
    19     30-34
    20     20-24
    21     15-19
    22     10-14
    23     15-19
    24     10-14
    25     20-24
    26     25-29
    27     30-34
    28     15-19
    29     15-19
           ...  
    750    20-24
    751    25-29
    752    15-19
    753    20-24
    754    30-34
    755    20-24
    756    20-24
    757    35-39
    758    20-24
    759    15-19
    760    25-29
    761    25-29
    762    35-39
    763    25-29
    764    25-29
    765    15-19
    766    20-24
    767    20-24
    768    20-24
    769    20-24
    770    20-24
    771    20-24
    772    15-19
    773    20-24
    774    20-24
    775    20-24
    776    10-14
    777    20-24
    778    20-24
    779    20-24
    Name: Age, Length: 780, dtype: category
    Categories (8, object): [< 10 < 10-14 < 15-19 < 20-24 < 25-29 < 30-34 < 35-39 < >45]




```python
#Summary of Bins
data1_df["Summary"] = pd.cut(data1_df["Age"], bins, labels=groups)
data1_df
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
      <th>Summary</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>5</th>
      <td>20</td>
      <td>Male</td>
      <td>10</td>
      <td>Sleepwalker</td>
      <td>1.73</td>
      <td>Tanimnya91</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>6</th>
      <td>20</td>
      <td>Male</td>
      <td>153</td>
      <td>Mercenary Sabre</td>
      <td>4.57</td>
      <td>Undjaskla97</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>7</th>
      <td>29</td>
      <td>Female</td>
      <td>169</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>3.32</td>
      <td>Iathenudil29</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>8</th>
      <td>25</td>
      <td>Male</td>
      <td>118</td>
      <td>Ghost Reaver, Longsword of Magic</td>
      <td>2.77</td>
      <td>Sondenasta63</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>9</th>
      <td>31</td>
      <td>Male</td>
      <td>99</td>
      <td>Expiration, Warscythe Of Lost Worlds</td>
      <td>4.53</td>
      <td>Hilaerin92</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>10</th>
      <td>24</td>
      <td>Male</td>
      <td>57</td>
      <td>Despair, Favor of Due Diligence</td>
      <td>3.81</td>
      <td>Chamosia29</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>11</th>
      <td>20</td>
      <td>Male</td>
      <td>47</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>1.55</td>
      <td>Sally64</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>12</th>
      <td>30</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Iskossa88</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>13</th>
      <td>23</td>
      <td>Male</td>
      <td>77</td>
      <td>Piety, Guardian of Riddles</td>
      <td>3.68</td>
      <td>Seorithstilis90</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>14</th>
      <td>40</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Sundast29</td>
      <td>&gt;45</td>
    </tr>
    <tr>
      <th>15</th>
      <td>21</td>
      <td>Male</td>
      <td>96</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>4.77</td>
      <td>Haellysu29</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>16</th>
      <td>22</td>
      <td>Female</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Sundista85</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>17</th>
      <td>22</td>
      <td>Female</td>
      <td>59</td>
      <td>Lightning, Etcher of the King</td>
      <td>1.65</td>
      <td>Aenarap34</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>18</th>
      <td>28</td>
      <td>Male</td>
      <td>91</td>
      <td>Celeste</td>
      <td>3.71</td>
      <td>Iskista88</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>19</th>
      <td>31</td>
      <td>Male</td>
      <td>177</td>
      <td>Winterthorn, Defender of Shifting Worlds</td>
      <td>4.89</td>
      <td>Assossa43</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>20</th>
      <td>24</td>
      <td>Male</td>
      <td>78</td>
      <td>Glimmer, Ender of the Moon</td>
      <td>2.33</td>
      <td>Irith83</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>21</th>
      <td>15</td>
      <td>Male</td>
      <td>3</td>
      <td>Phantomlight</td>
      <td>1.79</td>
      <td>Iaralrgue74</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>22</th>
      <td>11</td>
      <td>Female</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Deural48</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>23</th>
      <td>19</td>
      <td>Male</td>
      <td>183</td>
      <td>Dragon's Greatsword</td>
      <td>2.36</td>
      <td>Chanosia65</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>24</th>
      <td>11</td>
      <td>Male</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>1.96</td>
      <td>Qarwen67</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>25</th>
      <td>21</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Idai61</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>26</th>
      <td>29</td>
      <td>Male</td>
      <td>132</td>
      <td>Persuasion</td>
      <td>3.90</td>
      <td>Aerithllora36</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>27</th>
      <td>34</td>
      <td>Male</td>
      <td>106</td>
      <td>Crying Steel Sickle</td>
      <td>2.29</td>
      <td>Assastnya25</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>28</th>
      <td>15</td>
      <td>Male</td>
      <td>49</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>4.23</td>
      <td>Ilariarin45</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>29</th>
      <td>16</td>
      <td>Female</td>
      <td>45</td>
      <td>Glinting Glass Edge</td>
      <td>2.46</td>
      <td>Phaedai25</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>750</th>
      <td>23</td>
      <td>Male</td>
      <td>86</td>
      <td>Stormfury Lantern</td>
      <td>1.28</td>
      <td>Eollym91</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>751</th>
      <td>26</td>
      <td>Female</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>1.88</td>
      <td>Lisjasksda68</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>752</th>
      <td>15</td>
      <td>Female</td>
      <td>116</td>
      <td>Renewed Skeletal Katana</td>
      <td>2.37</td>
      <td>Yalostiphos68</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>753</th>
      <td>20</td>
      <td>Male</td>
      <td>4</td>
      <td>Bloodlord's Fetish</td>
      <td>2.28</td>
      <td>Thryallym62</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>754</th>
      <td>31</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Sondastan54</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>755</th>
      <td>22</td>
      <td>Female</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>1.88</td>
      <td>Ailaesuir66</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>756</th>
      <td>22</td>
      <td>Male</td>
      <td>6</td>
      <td>Rusty Skull</td>
      <td>1.20</td>
      <td>Siasri67</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>757</th>
      <td>35</td>
      <td>Male</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Seosri62</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>758</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Ryastycal90</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>759</th>
      <td>19</td>
      <td>Male</td>
      <td>87</td>
      <td>Deluge, Edge of the West</td>
      <td>2.20</td>
      <td>Chanirrasta87</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>760</th>
      <td>29</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Aerithllora36</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>761</th>
      <td>28</td>
      <td>Male</td>
      <td>175</td>
      <td>Woeful Adamantite Claymore</td>
      <td>1.24</td>
      <td>Raeduerin33</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>762</th>
      <td>36</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lisosiast26</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>763</th>
      <td>27</td>
      <td>Other / Non-Disclosed</td>
      <td>48</td>
      <td>Rage, Legacy of the Lone Victor</td>
      <td>4.32</td>
      <td>Eurisuru25</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>764</th>
      <td>25</td>
      <td>Male</td>
      <td>70</td>
      <td>Hope's End</td>
      <td>3.89</td>
      <td>Assassasda84</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>765</th>
      <td>15</td>
      <td>Male</td>
      <td>13</td>
      <td>Serenity</td>
      <td>1.49</td>
      <td>Aerithnucal56</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>766</th>
      <td>22</td>
      <td>Female</td>
      <td>84</td>
      <td>Arcane Gem</td>
      <td>2.23</td>
      <td>Nitherian58</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>767</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Hailaphos89</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>768</th>
      <td>21</td>
      <td>Male</td>
      <td>158</td>
      <td>Darkheart, Butcher of the Champion</td>
      <td>3.56</td>
      <td>Chamucosda93</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>769</th>
      <td>24</td>
      <td>Male</td>
      <td>73</td>
      <td>Ritual Mace</td>
      <td>3.74</td>
      <td>Frichilsasya78</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>770</th>
      <td>22</td>
      <td>Male</td>
      <td>141</td>
      <td>Persuasion</td>
      <td>3.27</td>
      <td>Aenasu69</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>771</th>
      <td>24</td>
      <td>Male</td>
      <td>25</td>
      <td>Hero Cane</td>
      <td>1.03</td>
      <td>Lassista97</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>772</th>
      <td>15</td>
      <td>Male</td>
      <td>31</td>
      <td>Trickster</td>
      <td>2.07</td>
      <td>Sidap51</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>773</th>
      <td>21</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Chamadarsda63</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>774</th>
      <td>24</td>
      <td>Male</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Lassassast73</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>775</th>
      <td>22</td>
      <td>Male</td>
      <td>98</td>
      <td>Deadline, Voice Of Subtlety</td>
      <td>3.62</td>
      <td>Eural50</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>776</th>
      <td>14</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Lirtossa78</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>777</th>
      <td>20</td>
      <td>Male</td>
      <td>117</td>
      <td>Heartstriker, Legacy of the Light</td>
      <td>4.15</td>
      <td>Tillyrin30</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>778</th>
      <td>20</td>
      <td>Male</td>
      <td>75</td>
      <td>Brutality Ivory Warmace</td>
      <td>1.72</td>
      <td>Quelaton80</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>779</th>
      <td>23</td>
      <td>Female</td>
      <td>107</td>
      <td>Splitter, Foe Of Subtlety</td>
      <td>3.61</td>
      <td>Alim85</td>
      <td>20-24</td>
    </tr>
  </tbody>
</table>
<p>780 rows × 7 columns</p>
</div>




```python
# Creating a group based off of the bins
Age_groups = data1_df.groupby("Summary")
#Purchase Counts
Age_groups['Item Name'].count()
```




    Summary
    < 10      28
    10-14     35
    15-19    133
    20-24    336
    25-29    125
    30-34     64
    35-39     42
    >45       17
    Name: Item Name, dtype: int64




```python
#Average Purchase Price
Age_groups['Price'].mean()
```




    Summary
    < 10     2.980714
    10-14    2.770000
    15-19    2.905414
    20-24    2.913006
    25-29    2.962640
    30-34    3.082031
    35-39    2.842857
    >45      3.161765
    Name: Price, dtype: float64




```python
#Total Purchase Value
Age_groups['Price'].sum()
```




    Summary
    < 10      83.46
    10-14     96.95
    15-19    386.42
    20-24    978.77
    25-29    370.33
    30-34    197.25
    35-39    119.40
    >45       53.75
    Name: Price, dtype: float64




```python
#Normalized Totals
Age_groups.std()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Item ID</th>
      <th>Price</th>
    </tr>
    <tr>
      <th>Summary</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>&lt; 10</th>
      <td>0.838082</td>
      <td>53.684989</td>
      <td>1.128358</td>
    </tr>
    <tr>
      <th>10-14</th>
      <td>1.316987</td>
      <td>61.037211</td>
      <td>1.103702</td>
    </tr>
    <tr>
      <th>15-19</th>
      <td>1.519937</td>
      <td>55.148891</td>
      <td>1.121010</td>
    </tr>
    <tr>
      <th>20-24</th>
      <td>1.512880</td>
      <td>50.467797</td>
      <td>1.112619</td>
    </tr>
    <tr>
      <th>25-29</th>
      <td>1.529284</td>
      <td>49.619152</td>
      <td>1.140724</td>
    </tr>
    <tr>
      <th>30-34</th>
      <td>1.387211</td>
      <td>57.242433</td>
      <td>1.176063</td>
    </tr>
    <tr>
      <th>35-39</th>
      <td>1.401841</td>
      <td>55.651526</td>
      <td>1.082714</td>
    </tr>
    <tr>
      <th>&gt;45</th>
      <td>1.416811</td>
      <td>47.094633</td>
      <td>0.898159</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Top Sepnders
grouped_df = data1_pd.groupby(['SN'])

# The object returned is a "GroupBy" object and cannot be viewed normally...
print(grouped_df)
```

    <pandas.core.groupby.DataFrameGroupBy object at 0x00000221A2B83F28>
    


```python
# In order to be visualized, a data function must be used...
grouped_df.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
      <th>Summary</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>5</th>
      <td>20</td>
      <td>Male</td>
      <td>10</td>
      <td>Sleepwalker</td>
      <td>1.73</td>
      <td>Tanimnya91</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>6</th>
      <td>20</td>
      <td>Male</td>
      <td>153</td>
      <td>Mercenary Sabre</td>
      <td>4.57</td>
      <td>Undjaskla97</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>7</th>
      <td>29</td>
      <td>Female</td>
      <td>169</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>3.32</td>
      <td>Iathenudil29</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>8</th>
      <td>25</td>
      <td>Male</td>
      <td>118</td>
      <td>Ghost Reaver, Longsword of Magic</td>
      <td>2.77</td>
      <td>Sondenasta63</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>9</th>
      <td>31</td>
      <td>Male</td>
      <td>99</td>
      <td>Expiration, Warscythe Of Lost Worlds</td>
      <td>4.53</td>
      <td>Hilaerin92</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>10</th>
      <td>24</td>
      <td>Male</td>
      <td>57</td>
      <td>Despair, Favor of Due Diligence</td>
      <td>3.81</td>
      <td>Chamosia29</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>11</th>
      <td>20</td>
      <td>Male</td>
      <td>47</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>1.55</td>
      <td>Sally64</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>12</th>
      <td>30</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Iskossa88</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>13</th>
      <td>23</td>
      <td>Male</td>
      <td>77</td>
      <td>Piety, Guardian of Riddles</td>
      <td>3.68</td>
      <td>Seorithstilis90</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>14</th>
      <td>40</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Sundast29</td>
      <td>&gt;45</td>
    </tr>
    <tr>
      <th>15</th>
      <td>21</td>
      <td>Male</td>
      <td>96</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>4.77</td>
      <td>Haellysu29</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>16</th>
      <td>22</td>
      <td>Female</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Sundista85</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>17</th>
      <td>22</td>
      <td>Female</td>
      <td>59</td>
      <td>Lightning, Etcher of the King</td>
      <td>1.65</td>
      <td>Aenarap34</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>18</th>
      <td>28</td>
      <td>Male</td>
      <td>91</td>
      <td>Celeste</td>
      <td>3.71</td>
      <td>Iskista88</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>19</th>
      <td>31</td>
      <td>Male</td>
      <td>177</td>
      <td>Winterthorn, Defender of Shifting Worlds</td>
      <td>4.89</td>
      <td>Assossa43</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>20</th>
      <td>24</td>
      <td>Male</td>
      <td>78</td>
      <td>Glimmer, Ender of the Moon</td>
      <td>2.33</td>
      <td>Irith83</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>21</th>
      <td>15</td>
      <td>Male</td>
      <td>3</td>
      <td>Phantomlight</td>
      <td>1.79</td>
      <td>Iaralrgue74</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>22</th>
      <td>11</td>
      <td>Female</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Deural48</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>23</th>
      <td>19</td>
      <td>Male</td>
      <td>183</td>
      <td>Dragon's Greatsword</td>
      <td>2.36</td>
      <td>Chanosia65</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>24</th>
      <td>11</td>
      <td>Male</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>1.96</td>
      <td>Qarwen67</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>25</th>
      <td>21</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Idai61</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>26</th>
      <td>29</td>
      <td>Male</td>
      <td>132</td>
      <td>Persuasion</td>
      <td>3.90</td>
      <td>Aerithllora36</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>27</th>
      <td>34</td>
      <td>Male</td>
      <td>106</td>
      <td>Crying Steel Sickle</td>
      <td>2.29</td>
      <td>Assastnya25</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>28</th>
      <td>15</td>
      <td>Male</td>
      <td>49</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>4.23</td>
      <td>Ilariarin45</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>29</th>
      <td>16</td>
      <td>Female</td>
      <td>45</td>
      <td>Glinting Glass Edge</td>
      <td>2.46</td>
      <td>Phaedai25</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>750</th>
      <td>23</td>
      <td>Male</td>
      <td>86</td>
      <td>Stormfury Lantern</td>
      <td>1.28</td>
      <td>Eollym91</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>751</th>
      <td>26</td>
      <td>Female</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>1.88</td>
      <td>Lisjasksda68</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>752</th>
      <td>15</td>
      <td>Female</td>
      <td>116</td>
      <td>Renewed Skeletal Katana</td>
      <td>2.37</td>
      <td>Yalostiphos68</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>753</th>
      <td>20</td>
      <td>Male</td>
      <td>4</td>
      <td>Bloodlord's Fetish</td>
      <td>2.28</td>
      <td>Thryallym62</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>754</th>
      <td>31</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Sondastan54</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>755</th>
      <td>22</td>
      <td>Female</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>1.88</td>
      <td>Ailaesuir66</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>756</th>
      <td>22</td>
      <td>Male</td>
      <td>6</td>
      <td>Rusty Skull</td>
      <td>1.20</td>
      <td>Siasri67</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>757</th>
      <td>35</td>
      <td>Male</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Seosri62</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>758</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Ryastycal90</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>759</th>
      <td>19</td>
      <td>Male</td>
      <td>87</td>
      <td>Deluge, Edge of the West</td>
      <td>2.20</td>
      <td>Chanirrasta87</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>760</th>
      <td>29</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Aerithllora36</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>761</th>
      <td>28</td>
      <td>Male</td>
      <td>175</td>
      <td>Woeful Adamantite Claymore</td>
      <td>1.24</td>
      <td>Raeduerin33</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>762</th>
      <td>36</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lisosiast26</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>763</th>
      <td>27</td>
      <td>Other / Non-Disclosed</td>
      <td>48</td>
      <td>Rage, Legacy of the Lone Victor</td>
      <td>4.32</td>
      <td>Eurisuru25</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>764</th>
      <td>25</td>
      <td>Male</td>
      <td>70</td>
      <td>Hope's End</td>
      <td>3.89</td>
      <td>Assassasda84</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>765</th>
      <td>15</td>
      <td>Male</td>
      <td>13</td>
      <td>Serenity</td>
      <td>1.49</td>
      <td>Aerithnucal56</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>766</th>
      <td>22</td>
      <td>Female</td>
      <td>84</td>
      <td>Arcane Gem</td>
      <td>2.23</td>
      <td>Nitherian58</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>767</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Hailaphos89</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>768</th>
      <td>21</td>
      <td>Male</td>
      <td>158</td>
      <td>Darkheart, Butcher of the Champion</td>
      <td>3.56</td>
      <td>Chamucosda93</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>769</th>
      <td>24</td>
      <td>Male</td>
      <td>73</td>
      <td>Ritual Mace</td>
      <td>3.74</td>
      <td>Frichilsasya78</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>770</th>
      <td>22</td>
      <td>Male</td>
      <td>141</td>
      <td>Persuasion</td>
      <td>3.27</td>
      <td>Aenasu69</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>771</th>
      <td>24</td>
      <td>Male</td>
      <td>25</td>
      <td>Hero Cane</td>
      <td>1.03</td>
      <td>Lassista97</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>772</th>
      <td>15</td>
      <td>Male</td>
      <td>31</td>
      <td>Trickster</td>
      <td>2.07</td>
      <td>Sidap51</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>773</th>
      <td>21</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Chamadarsda63</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>774</th>
      <td>24</td>
      <td>Male</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Lassassast73</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>775</th>
      <td>22</td>
      <td>Male</td>
      <td>98</td>
      <td>Deadline, Voice Of Subtlety</td>
      <td>3.62</td>
      <td>Eural50</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>776</th>
      <td>14</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Lirtossa78</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>777</th>
      <td>20</td>
      <td>Male</td>
      <td>117</td>
      <td>Heartstriker, Legacy of the Light</td>
      <td>4.15</td>
      <td>Tillyrin30</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>778</th>
      <td>20</td>
      <td>Male</td>
      <td>75</td>
      <td>Brutality Ivory Warmace</td>
      <td>1.72</td>
      <td>Quelaton80</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>779</th>
      <td>23</td>
      <td>Female</td>
      <td>107</td>
      <td>Splitter, Foe Of Subtlety</td>
      <td>3.61</td>
      <td>Alim85</td>
      <td>20-24</td>
    </tr>
  </tbody>
</table>
<p>780 rows × 7 columns</p>
</div>




```python
#Purchase Count
Purch_Count = grouped_df['Price'].count()

#Avgerage Purchase Price
Purch_Avg = grouped_df['Price'].mean()

#Sum up Total Purch
Purch_Total = grouped_df['Price'].sum()

```


```python
#Create Table of Results
summary_table = pd.DataFrame({"Purchase Count":Purch_Count,
                                   "Average Purchase Price":Purch_Avg, 'Total Purchase Value' : Purch_Total})
#Final Summary_table
Final_Spender_df = summary_table.sort_values('Total Purchase Value', ascending=False)
Final_Spender_df.head(5)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Average Purchase Price</th>
      <th>Purchase Count</th>
      <th>Total Purchase Value</th>
    </tr>
    <tr>
      <th>SN</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Undirrala66</th>
      <td>3.412000</td>
      <td>5</td>
      <td>17.06</td>
    </tr>
    <tr>
      <th>Saedue76</th>
      <td>3.390000</td>
      <td>4</td>
      <td>13.56</td>
    </tr>
    <tr>
      <th>Mindimnya67</th>
      <td>3.185000</td>
      <td>4</td>
      <td>12.74</td>
    </tr>
    <tr>
      <th>Haellysu29</th>
      <td>4.243333</td>
      <td>3</td>
      <td>12.73</td>
    </tr>
    <tr>
      <th>Eoda93</th>
      <td>3.860000</td>
      <td>3</td>
      <td>11.58</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Most Popular Items
grouped_df = data1_pd.groupby(['Item Name'])

# The object returned is a "GroupBy" object and cannot be viewed normally...
print(grouped_df)
```

    <pandas.core.groupby.DataFrameGroupBy object at 0x00000221A2B15C88>
    


```python
# In order to be visualized, a data function must be used...
grouped_df.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
      <th>Summary</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>5</th>
      <td>20</td>
      <td>Male</td>
      <td>10</td>
      <td>Sleepwalker</td>
      <td>1.73</td>
      <td>Tanimnya91</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>6</th>
      <td>20</td>
      <td>Male</td>
      <td>153</td>
      <td>Mercenary Sabre</td>
      <td>4.57</td>
      <td>Undjaskla97</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>7</th>
      <td>29</td>
      <td>Female</td>
      <td>169</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>3.32</td>
      <td>Iathenudil29</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>8</th>
      <td>25</td>
      <td>Male</td>
      <td>118</td>
      <td>Ghost Reaver, Longsword of Magic</td>
      <td>2.77</td>
      <td>Sondenasta63</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>9</th>
      <td>31</td>
      <td>Male</td>
      <td>99</td>
      <td>Expiration, Warscythe Of Lost Worlds</td>
      <td>4.53</td>
      <td>Hilaerin92</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>10</th>
      <td>24</td>
      <td>Male</td>
      <td>57</td>
      <td>Despair, Favor of Due Diligence</td>
      <td>3.81</td>
      <td>Chamosia29</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>11</th>
      <td>20</td>
      <td>Male</td>
      <td>47</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>1.55</td>
      <td>Sally64</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>12</th>
      <td>30</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Iskossa88</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>13</th>
      <td>23</td>
      <td>Male</td>
      <td>77</td>
      <td>Piety, Guardian of Riddles</td>
      <td>3.68</td>
      <td>Seorithstilis90</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>14</th>
      <td>40</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Sundast29</td>
      <td>&gt;45</td>
    </tr>
    <tr>
      <th>15</th>
      <td>21</td>
      <td>Male</td>
      <td>96</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>4.77</td>
      <td>Haellysu29</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>16</th>
      <td>22</td>
      <td>Female</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Sundista85</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>17</th>
      <td>22</td>
      <td>Female</td>
      <td>59</td>
      <td>Lightning, Etcher of the King</td>
      <td>1.65</td>
      <td>Aenarap34</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>18</th>
      <td>28</td>
      <td>Male</td>
      <td>91</td>
      <td>Celeste</td>
      <td>3.71</td>
      <td>Iskista88</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>19</th>
      <td>31</td>
      <td>Male</td>
      <td>177</td>
      <td>Winterthorn, Defender of Shifting Worlds</td>
      <td>4.89</td>
      <td>Assossa43</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>20</th>
      <td>24</td>
      <td>Male</td>
      <td>78</td>
      <td>Glimmer, Ender of the Moon</td>
      <td>2.33</td>
      <td>Irith83</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>21</th>
      <td>15</td>
      <td>Male</td>
      <td>3</td>
      <td>Phantomlight</td>
      <td>1.79</td>
      <td>Iaralrgue74</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>22</th>
      <td>11</td>
      <td>Female</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Deural48</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>23</th>
      <td>19</td>
      <td>Male</td>
      <td>183</td>
      <td>Dragon's Greatsword</td>
      <td>2.36</td>
      <td>Chanosia65</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>24</th>
      <td>11</td>
      <td>Male</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>1.96</td>
      <td>Qarwen67</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>25</th>
      <td>21</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Idai61</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>26</th>
      <td>29</td>
      <td>Male</td>
      <td>132</td>
      <td>Persuasion</td>
      <td>3.90</td>
      <td>Aerithllora36</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>27</th>
      <td>34</td>
      <td>Male</td>
      <td>106</td>
      <td>Crying Steel Sickle</td>
      <td>2.29</td>
      <td>Assastnya25</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>28</th>
      <td>15</td>
      <td>Male</td>
      <td>49</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>4.23</td>
      <td>Ilariarin45</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>29</th>
      <td>16</td>
      <td>Female</td>
      <td>45</td>
      <td>Glinting Glass Edge</td>
      <td>2.46</td>
      <td>Phaedai25</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>727</th>
      <td>25</td>
      <td>Male</td>
      <td>139</td>
      <td>Mercy, Katana of Dismay</td>
      <td>4.37</td>
      <td>Eurith26</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>728</th>
      <td>22</td>
      <td>Male</td>
      <td>48</td>
      <td>Rage, Legacy of the Lone Victor</td>
      <td>4.32</td>
      <td>Tyananurgue44</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>729</th>
      <td>16</td>
      <td>Male</td>
      <td>134</td>
      <td>Undead Crusader</td>
      <td>4.67</td>
      <td>Iskichinya81</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>732</th>
      <td>23</td>
      <td>Female</td>
      <td>37</td>
      <td>Shadow Strike, Glory of Ending Hope</td>
      <td>1.93</td>
      <td>Shidai42</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>735</th>
      <td>10</td>
      <td>Male</td>
      <td>16</td>
      <td>Restored Bauble</td>
      <td>3.11</td>
      <td>Ethrusuard41</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>736</th>
      <td>19</td>
      <td>Male</td>
      <td>45</td>
      <td>Glinting Glass Edge</td>
      <td>2.46</td>
      <td>Indirrian56</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>738</th>
      <td>25</td>
      <td>Male</td>
      <td>56</td>
      <td>Foul Titanium Battle Axe</td>
      <td>4.33</td>
      <td>Tyadaru49</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>739</th>
      <td>35</td>
      <td>Female</td>
      <td>93</td>
      <td>Apocalyptic Battlescythe</td>
      <td>3.91</td>
      <td>Cosadar58</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>743</th>
      <td>20</td>
      <td>Male</td>
      <td>134</td>
      <td>Undead Crusader</td>
      <td>4.67</td>
      <td>Haedasu65</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>747</th>
      <td>32</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lamon28</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>748</th>
      <td>15</td>
      <td>Male</td>
      <td>120</td>
      <td>Agatha</td>
      <td>1.91</td>
      <td>Isri49</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>749</th>
      <td>21</td>
      <td>Male</td>
      <td>114</td>
      <td>Yearning Mageblade</td>
      <td>1.79</td>
      <td>Frichassala85</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>750</th>
      <td>23</td>
      <td>Male</td>
      <td>86</td>
      <td>Stormfury Lantern</td>
      <td>1.28</td>
      <td>Eollym91</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>752</th>
      <td>15</td>
      <td>Female</td>
      <td>116</td>
      <td>Renewed Skeletal Katana</td>
      <td>2.37</td>
      <td>Yalostiphos68</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>753</th>
      <td>20</td>
      <td>Male</td>
      <td>4</td>
      <td>Bloodlord's Fetish</td>
      <td>2.28</td>
      <td>Thryallym62</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>754</th>
      <td>31</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Sondastan54</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>756</th>
      <td>22</td>
      <td>Male</td>
      <td>6</td>
      <td>Rusty Skull</td>
      <td>1.20</td>
      <td>Siasri67</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>758</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Ryastycal90</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>759</th>
      <td>19</td>
      <td>Male</td>
      <td>87</td>
      <td>Deluge, Edge of the West</td>
      <td>2.20</td>
      <td>Chanirrasta87</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>760</th>
      <td>29</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Aerithllora36</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>762</th>
      <td>36</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lisosiast26</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>763</th>
      <td>27</td>
      <td>Other / Non-Disclosed</td>
      <td>48</td>
      <td>Rage, Legacy of the Lone Victor</td>
      <td>4.32</td>
      <td>Eurisuru25</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>764</th>
      <td>25</td>
      <td>Male</td>
      <td>70</td>
      <td>Hope's End</td>
      <td>3.89</td>
      <td>Assassasda84</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>767</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Hailaphos89</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>771</th>
      <td>24</td>
      <td>Male</td>
      <td>25</td>
      <td>Hero Cane</td>
      <td>1.03</td>
      <td>Lassista97</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>774</th>
      <td>24</td>
      <td>Male</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Lassassast73</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>775</th>
      <td>22</td>
      <td>Male</td>
      <td>98</td>
      <td>Deadline, Voice Of Subtlety</td>
      <td>3.62</td>
      <td>Eural50</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>776</th>
      <td>14</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Lirtossa78</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>777</th>
      <td>20</td>
      <td>Male</td>
      <td>117</td>
      <td>Heartstriker, Legacy of the Light</td>
      <td>4.15</td>
      <td>Tillyrin30</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>778</th>
      <td>20</td>
      <td>Male</td>
      <td>75</td>
      <td>Brutality Ivory Warmace</td>
      <td>1.72</td>
      <td>Quelaton80</td>
      <td>20-24</td>
    </tr>
  </tbody>
</table>
<p>679 rows × 7 columns</p>
</div>




```python
#Purchase Count
Purch_Count = grouped_df['Item Name'].count()

#Item ID
Item_ID = grouped_df["Item ID"].sum()

#Item Price
Item_Price = grouped_df["Price"].sum()


#Sum up Total Purch
Purch_Total = Purch_Count * Item_Price

```


```python
#Create Table of Results
summary_table = pd.DataFrame({'Item ID':Item_ID, "Purchase Count":Purch_Count, "Item Price":Item_Price,
                            'Total Purchase Value' : Purch_Total})
#Final Summary_table
Final_Spender_df = summary_table.sort_values('Purchase Count', ascending=False,)
Final_Spender_df.head(5)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Item ID</th>
      <th>Item Price</th>
      <th>Purchase Count</th>
      <th>Total Purchase Value</th>
    </tr>
    <tr>
      <th>Item Name</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Final Critic</th>
      <td>1342</td>
      <td>38.60</td>
      <td>14</td>
      <td>540.40</td>
    </tr>
    <tr>
      <th>Arcane Gem</th>
      <td>924</td>
      <td>24.53</td>
      <td>11</td>
      <td>269.83</td>
    </tr>
    <tr>
      <th>Betrayal, Whisper of Grieving Widows</th>
      <td>429</td>
      <td>25.85</td>
      <td>11</td>
      <td>284.35</td>
    </tr>
    <tr>
      <th>Stormcaller</th>
      <td>1050</td>
      <td>34.65</td>
      <td>10</td>
      <td>346.50</td>
    </tr>
    <tr>
      <th>Woeful Adamantite Claymore</th>
      <td>1575</td>
      <td>11.16</td>
      <td>9</td>
      <td>100.44</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Most Profitable Items
#Most Popular Items
grouped_df = data1_pd.groupby(['Item Name'])

# The object returned is a "GroupBy" object and cannot be viewed normally...
print(grouped_df)
```

    <pandas.core.groupby.DataFrameGroupBy object at 0x00000221A2BA3400>
    


```python
# In order to be visualized, a data function must be used...
grouped_df.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
      <th>Summary</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>5</th>
      <td>20</td>
      <td>Male</td>
      <td>10</td>
      <td>Sleepwalker</td>
      <td>1.73</td>
      <td>Tanimnya91</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>6</th>
      <td>20</td>
      <td>Male</td>
      <td>153</td>
      <td>Mercenary Sabre</td>
      <td>4.57</td>
      <td>Undjaskla97</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>7</th>
      <td>29</td>
      <td>Female</td>
      <td>169</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>3.32</td>
      <td>Iathenudil29</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>8</th>
      <td>25</td>
      <td>Male</td>
      <td>118</td>
      <td>Ghost Reaver, Longsword of Magic</td>
      <td>2.77</td>
      <td>Sondenasta63</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>9</th>
      <td>31</td>
      <td>Male</td>
      <td>99</td>
      <td>Expiration, Warscythe Of Lost Worlds</td>
      <td>4.53</td>
      <td>Hilaerin92</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>10</th>
      <td>24</td>
      <td>Male</td>
      <td>57</td>
      <td>Despair, Favor of Due Diligence</td>
      <td>3.81</td>
      <td>Chamosia29</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>11</th>
      <td>20</td>
      <td>Male</td>
      <td>47</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>1.55</td>
      <td>Sally64</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>12</th>
      <td>30</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Iskossa88</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>13</th>
      <td>23</td>
      <td>Male</td>
      <td>77</td>
      <td>Piety, Guardian of Riddles</td>
      <td>3.68</td>
      <td>Seorithstilis90</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>14</th>
      <td>40</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Sundast29</td>
      <td>&gt;45</td>
    </tr>
    <tr>
      <th>15</th>
      <td>21</td>
      <td>Male</td>
      <td>96</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>4.77</td>
      <td>Haellysu29</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>16</th>
      <td>22</td>
      <td>Female</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Sundista85</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>17</th>
      <td>22</td>
      <td>Female</td>
      <td>59</td>
      <td>Lightning, Etcher of the King</td>
      <td>1.65</td>
      <td>Aenarap34</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>18</th>
      <td>28</td>
      <td>Male</td>
      <td>91</td>
      <td>Celeste</td>
      <td>3.71</td>
      <td>Iskista88</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>19</th>
      <td>31</td>
      <td>Male</td>
      <td>177</td>
      <td>Winterthorn, Defender of Shifting Worlds</td>
      <td>4.89</td>
      <td>Assossa43</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>20</th>
      <td>24</td>
      <td>Male</td>
      <td>78</td>
      <td>Glimmer, Ender of the Moon</td>
      <td>2.33</td>
      <td>Irith83</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>21</th>
      <td>15</td>
      <td>Male</td>
      <td>3</td>
      <td>Phantomlight</td>
      <td>1.79</td>
      <td>Iaralrgue74</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>22</th>
      <td>11</td>
      <td>Female</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Deural48</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>23</th>
      <td>19</td>
      <td>Male</td>
      <td>183</td>
      <td>Dragon's Greatsword</td>
      <td>2.36</td>
      <td>Chanosia65</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>24</th>
      <td>11</td>
      <td>Male</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>1.96</td>
      <td>Qarwen67</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>25</th>
      <td>21</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Idai61</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>26</th>
      <td>29</td>
      <td>Male</td>
      <td>132</td>
      <td>Persuasion</td>
      <td>3.90</td>
      <td>Aerithllora36</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>27</th>
      <td>34</td>
      <td>Male</td>
      <td>106</td>
      <td>Crying Steel Sickle</td>
      <td>2.29</td>
      <td>Assastnya25</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>28</th>
      <td>15</td>
      <td>Male</td>
      <td>49</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>4.23</td>
      <td>Ilariarin45</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>29</th>
      <td>16</td>
      <td>Female</td>
      <td>45</td>
      <td>Glinting Glass Edge</td>
      <td>2.46</td>
      <td>Phaedai25</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>708</th>
      <td>25</td>
      <td>Male</td>
      <td>73</td>
      <td>Ritual Mace</td>
      <td>3.74</td>
      <td>Saedue76</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>710</th>
      <td>27</td>
      <td>Female</td>
      <td>67</td>
      <td>Celeste, Incarnation of the Corrupted</td>
      <td>2.31</td>
      <td>Tyaelorgue39</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>712</th>
      <td>13</td>
      <td>Male</td>
      <td>5</td>
      <td>Putrid Fan</td>
      <td>1.32</td>
      <td>Isketo41</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>713</th>
      <td>21</td>
      <td>Male</td>
      <td>159</td>
      <td>Oathbreaker, Spellblade of Trials</td>
      <td>3.01</td>
      <td>Sundast87</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>714</th>
      <td>24</td>
      <td>Male</td>
      <td>37</td>
      <td>Shadow Strike, Glory of Ending Hope</td>
      <td>1.93</td>
      <td>Yadacal26</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>719</th>
      <td>25</td>
      <td>Male</td>
      <td>169</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>3.32</td>
      <td>Iduedru67</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>720</th>
      <td>7</td>
      <td>Male</td>
      <td>82</td>
      <td>Nirvana</td>
      <td>1.11</td>
      <td>Yarithsurgue62</td>
      <td>&lt; 10</td>
    </tr>
    <tr>
      <th>723</th>
      <td>20</td>
      <td>Male</td>
      <td>69</td>
      <td>Frenzy, Defender of the Harvest</td>
      <td>1.06</td>
      <td>Tillyrin30</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>725</th>
      <td>15</td>
      <td>Male</td>
      <td>14</td>
      <td>Possessed Core</td>
      <td>1.59</td>
      <td>Quarusrion32</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>727</th>
      <td>25</td>
      <td>Male</td>
      <td>139</td>
      <td>Mercy, Katana of Dismay</td>
      <td>4.37</td>
      <td>Eurith26</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>729</th>
      <td>16</td>
      <td>Male</td>
      <td>134</td>
      <td>Undead Crusader</td>
      <td>4.67</td>
      <td>Iskichinya81</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>732</th>
      <td>23</td>
      <td>Female</td>
      <td>37</td>
      <td>Shadow Strike, Glory of Ending Hope</td>
      <td>1.93</td>
      <td>Shidai42</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>735</th>
      <td>10</td>
      <td>Male</td>
      <td>16</td>
      <td>Restored Bauble</td>
      <td>3.11</td>
      <td>Ethrusuard41</td>
      <td>10-14</td>
    </tr>
    <tr>
      <th>738</th>
      <td>25</td>
      <td>Male</td>
      <td>56</td>
      <td>Foul Titanium Battle Axe</td>
      <td>4.33</td>
      <td>Tyadaru49</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>743</th>
      <td>20</td>
      <td>Male</td>
      <td>134</td>
      <td>Undead Crusader</td>
      <td>4.67</td>
      <td>Haedasu65</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>747</th>
      <td>32</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lamon28</td>
      <td>30-34</td>
    </tr>
    <tr>
      <th>748</th>
      <td>15</td>
      <td>Male</td>
      <td>120</td>
      <td>Agatha</td>
      <td>1.91</td>
      <td>Isri49</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>749</th>
      <td>21</td>
      <td>Male</td>
      <td>114</td>
      <td>Yearning Mageblade</td>
      <td>1.79</td>
      <td>Frichassala85</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>750</th>
      <td>23</td>
      <td>Male</td>
      <td>86</td>
      <td>Stormfury Lantern</td>
      <td>1.28</td>
      <td>Eollym91</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>752</th>
      <td>15</td>
      <td>Female</td>
      <td>116</td>
      <td>Renewed Skeletal Katana</td>
      <td>2.37</td>
      <td>Yalostiphos68</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>753</th>
      <td>20</td>
      <td>Male</td>
      <td>4</td>
      <td>Bloodlord's Fetish</td>
      <td>2.28</td>
      <td>Thryallym62</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>756</th>
      <td>22</td>
      <td>Male</td>
      <td>6</td>
      <td>Rusty Skull</td>
      <td>1.20</td>
      <td>Siasri67</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>758</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Ryastycal90</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>759</th>
      <td>19</td>
      <td>Male</td>
      <td>87</td>
      <td>Deluge, Edge of the West</td>
      <td>2.20</td>
      <td>Chanirrasta87</td>
      <td>15-19</td>
    </tr>
    <tr>
      <th>760</th>
      <td>29</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Aerithllora36</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>762</th>
      <td>36</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lisosiast26</td>
      <td>35-39</td>
    </tr>
    <tr>
      <th>764</th>
      <td>25</td>
      <td>Male</td>
      <td>70</td>
      <td>Hope's End</td>
      <td>3.89</td>
      <td>Assassasda84</td>
      <td>25-29</td>
    </tr>
    <tr>
      <th>767</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Hailaphos89</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>774</th>
      <td>24</td>
      <td>Male</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Lassassast73</td>
      <td>20-24</td>
    </tr>
    <tr>
      <th>778</th>
      <td>20</td>
      <td>Male</td>
      <td>75</td>
      <td>Brutality Ivory Warmace</td>
      <td>1.72</td>
      <td>Quelaton80</td>
      <td>20-24</td>
    </tr>
  </tbody>
</table>
<p>622 rows × 7 columns</p>
</div>




```python

#Item ID
Item_ID = grouped_df["Item ID"].sum()

#Item Price
Item_Price = grouped_df["Price"].max()

#Purchase Count
Purch_Count = grouped_df['Price'].count()


#Sum up Total Purch
Purch_Total = Purch_Count * Item_Price

```


```python
#Create Table of Results
summary_table = pd.DataFrame({'Item ID':Item_ID, "Purchase Count":Purch_Count, "Item Price":Item_Price,
                            'Total Purchase Value' : Purch_Total})
#Final Summary_table
Final_Spender_df = summary_table.sort_values('Total Purchase Value', ascending=False,)
Final_Spender_df.head(5)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Item ID</th>
      <th>Item Price</th>
      <th>Purchase Count</th>
      <th>Total Purchase Value</th>
    </tr>
    <tr>
      <th>Item Name</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Final Critic</th>
      <td>1342</td>
      <td>38.60</td>
      <td>14</td>
      <td>540.40</td>
    </tr>
    <tr>
      <th>Stormcaller</th>
      <td>1050</td>
      <td>34.65</td>
      <td>10</td>
      <td>346.50</td>
    </tr>
    <tr>
      <th>Retribution Axe</th>
      <td>306</td>
      <td>37.26</td>
      <td>9</td>
      <td>335.34</td>
    </tr>
    <tr>
      <th>Betrayal, Whisper of Grieving Widows</th>
      <td>429</td>
      <td>25.85</td>
      <td>11</td>
      <td>284.35</td>
    </tr>
    <tr>
      <th>Arcane Gem</th>
      <td>924</td>
      <td>24.53</td>
      <td>11</td>
      <td>269.83</td>
    </tr>
  </tbody>
</table>
</div>


