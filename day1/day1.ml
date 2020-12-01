let data =
  [1935;1956;1991;1425;1671;1537;1984;1569;1873;1840;1720;1937;1823;1625;1727;
   1812;1714;1900;1939;1931;1951;1756;1942;1611;1979;1930;1996;2000;1544;1780;1687;
   1760;1836;1814;1691;1817;1964;1899;1577;1547;866;1560;1988;1601;1970;1738;1507;
   1667;1851;1933;1515;1856;1969;1860;1801;2007;1866;1800;1749;1843;1711;1495;1905;
   763;1672;1858;1987;1492;1849;1993;1737;1874;1658;1810;1665;1768;1950;1879;1816;
   1868;1995;1763;1783;1833;1968;1847;1748;1725;1891;1755;286;1976;1977;1655;1808;
   1986;1779;1861;1953;1888;1792;1811;1872;1790;1839;1985;1827;1842;1925;1735;1635;
   1821;1820;1973;1531;1770;59;1846;1932;1907;1730;933;1395;1753;1751;361;1530;
   1782;1087;1589;1929;1795;1815;1732;1765;1877;1722;526;1709;1789;1892;1913;1662;
   1809;1670;1947;1835;1587;1758;1982;2009;1757;670;1983;1524;1878;1796;1952;566;
   1922;1882;1870;1799;1731;1724;1805;2003;1596;1566;1853;1911;1857;1739;1744;1627;
   1729;1745;1845;1582;1884;1883;1941;1764;1685;1791;1837;1697;1742;1781;1948;1876;
   1989;1643;1871;1906;1726;1958;1502;1927;1946]

let print_results_list res =
  let add = ref 0 in
  let mult = ref 1 in
  let res = List.map (fun el -> add := el + !add; mult := el * !mult;string_of_int el) res in
  Printf.printf "Result : %s = %d\n" (String.concat " + " res) !add;
  Printf.printf "Secret number : %d\n" !mult

let nb_iter = ref 0

let rec k_upto acc k n l =
  incr nb_iter;
  if List.length l < k then raise Not_found;
  match l with
  | [] -> raise Not_found
  | [hd] ->
    if hd = n then (hd::acc) else raise Not_found
  | hd :: tl ->
    (try
       if k = 1 && hd = n then (hd::acc)
       else if k > 1 && hd < n then
         (k_upto (hd::acc) (k-1) (n-hd) tl)
       else raise Not_found
     with Not_found -> k_upto acc k n tl)

let () =
  try
    let res = k_upto [] 2 2020 data in
    print_results_list res;
    Printf.printf "Number of iterations : %d\n" !nb_iter
  with
    Not_found -> Printf.printf "No matching data\n"