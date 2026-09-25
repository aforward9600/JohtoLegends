Cry_Kirlia:
	musicheader 3, 5, Cry_kirlia_Ch5
	musicheader 1, 6, Cry_kirlia_Ch6
	musicheader 1, 8, Cry_kirlia_Ch8

Cry_kirlia_Ch5:
	dutycycle $1
	sound __, 1, $a8, $0780
	sound __, 1, $d8, $0780
	dutycycle $3
	sound __, 1, $d8, $0789
	dutycycle $2
	sound __, 1, $d8, $0788
	dutycycle $1
	sound __, 1, $d8, $0788
	dutycycle $3
	sound __, 1, $d8, $0788
	sound __, 1, $d8, $0788
	dutycycle $2
	sound __, 1, $d8, $078c
	dutycycle $3
	sound __, 1, $d8, $0788
	dutycycle $1
	sound __, 1, $d8, $0787
	sound __, 1, $d8, $0780
	dutycycle $3
	sound __, 1, $d8, $0787
	sound __, 1, $d8, $0781
	sound __, 1, $d8, $0781
	dutycycle $2
	sound __, 1, $d8, $078b
	dutycycle $3
	sound __, 1, $d8, $0789
	sound __, 1, $d8, $0789
	dutycycle $2
	sound __, 1, $d8, $078c
	dutycycle $3
	sound __, 1, $c8, $0789
	sound __, 1, $c8, $0786
	dutycycle $1
	sound __, 1, $a8, $0780
	sound __, 1, $b8, $0781
	dutycycle $3
	sound __, 1, $a8, $0780
	dutycycle $0
	sound __, 1, $78, $0780
	sound __, 1, $58, $0780
	dutycycle $1
	sound __, 1, $68, $0780
	dutycycle $3
	sound __, 1, $58, $0789
	sound __, 1, $38, $0786
	sound __, 1, $28, $0787
	dutycycle $2
	sound __, 1, $28, $0789
	dutycycle $0
	sound __, 1, $18, $0780
	dutycycle $3
	sound __, 1, $08, $0000
	dutycycle $2
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	dutycycle $1
	sound __, 1, $08, $0000
	endchannel

Cry_kirlia_Ch6:
	dutycycle $2
	sound __, 1, $68, $078c
	sound __, 1, $68, $078d
	dutycycle $0
	sound __, 1, $68, $073f
	sound __, 1, $58, $073d
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	sound __, 1, $68, $073e
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	sound __, 1, $58, $0740
	dutycycle $1
	sound __, 1, $08, $0000
	dutycycle $2
	sound __, 1, $68, $0790
	sound __, 1, $68, $078f
	dutycycle $0
	sound __, 1, $08, $0000
	dutycycle $2
	sound __, 1, $48, $077d
	dutycycle $3
	sound __, 1, $08, $0000
	dutycycle $2
	sound __, 1, $68, $0777
	dutycycle $0
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	dutycycle $2
	sound __, 1, $08, $0000
	sound __, 1, $38, $078b
	sound __, 1, $38, $078b
	sound __, 1, $28, $078d
	dutycycle $0
	sound __, 1, $28, $073f
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	dutycycle $3
	sound __, 1, $18, $077d
	dutycycle $0
	sound __, 1, $18, $074b
	sound __, 1, $08, $0000
	dutycycle $3
	sound __, 1, $08, $0000
	sound __, 1, $08, $0000
	dutycycle $0
	sound __, 1, $08, $0000
	endchannel

Cry_kirlia_Ch8:
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $38, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $18, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $28, $004b
	noise __, 1, $18, $004b
	noise __, 1, $18, $004b
	noise __, 1, $18, $004b
	noise __, 1, $18, $004b
	noise __, 1, $18, $004b
	noise __, 1, $18, $004b
	noise __, 1, $18, $004b
	noise __, 1, $08, $004b
	noise __, 1, $08, $004b
	noise __, 1, $08, $004b
	noise __, 1, $08, $004b
	endchannel

Cry_Sentret:
	musicheader 2, 5, Cry_Sentret_Ch5
	musicheader 1, 6, Cry_Sentret_Ch6

Cry_Sentret_Ch5:
	tone $0020
	dutycycle $0
	jumpchannel Cry_Sentret_branch_f312b

Cry_Sentret_Ch6:
	sound_duty 3, 2, 1, 0
Cry_Sentret_branch_f312b:
	sound __,  9, $39, $072d
	sound __,  9, $f1, $0720
	endchannel

Cry_Sentret_Ch8:
	noise __,  9, $3b, $0
	noise __,  9, $92, $0
	endchannel

Cry_Slugma:
	musicheader 2, 5, Cry_Slugma_Ch5
	musicheader $1, 8, Cry_Slugma_Ch8

Cry_Slugma_Ch5:
	sound_duty 1, 0, 1, 2
	sound __, 13, $f2, $07a6
	sound __,  5, $f8, $07b0
	sound __,  5, $e8, $03b0
	sound __,  7, $f8, $03a0
	sound __,  9, $e1, $0290
	endchannel

Cry_Slugma_Ch8:
	noise __, 13, $b2, $50
	noise __,  9, $a8, $60
	noise __,  7, $a8, $5b
	noise __,  9, $a1, $5c
	endchannel

Cry_Lairon:
	musicheader 3, 5, Cry_lairon_Ch5
	musicheader 1, 6, Cry_lairon_Ch6
	musicheader 1, 8, Cry_lairon_Ch8

Cry_lairon_Ch5:
	dutycycle $2
	sound __, 2, $d8, 1917
	dutycycle $0
	sound __, 2, $d8, 1918
	dutycycle $3
	sound __, 2, $d8, 1917
	dutycycle $2
	sound __, 2, $d8, 1917
	dutycycle $1
	sound __, 2, $d8, 1918
	dutycycle $2
	sound __, 2, $d8, 1916
	sound __, 2, $d8, 1885
	dutycycle $3
	sound __, 2, $d8, 1886
	sound __, 2, $d8, 1890
	dutycycle $0
	sound __, 2, $d8, 1923
	dutycycle $3
	sound __, 2, $c8, 1922
	dutycycle $2
	sound __, 2, $d8, 1920
	sound __, 2, $d8, 1924
	sound __, 2, $d8, 1883
	sound __, 2, $d8, 1885
	sound __, 2, $d8, 1880
	sound __, 2, $d8, 1886
	sound __, 2, $d8, 1874
	sound __, 2, $d8, 1877
	sound __, 2, $d8, 1879
	sound __, 2, $d8, 1877
	sound __, 2, $d8, 1872
	dutycycle $1
	sound __, 2, $d8, 1871
	dutycycle $2
	sound __, 2, $d8, 1868
	dutycycle $3
	sound __, 2, $d8, 1871
	dutycycle $2
	sound __, 2, $a8, 1880
	sound __, 2, $b8, 1872
	sound __, 2, $78, 1865
	sound __, 2, $38, 1869
	dutycycle $3
	sound __, 1, $08, 0
	endchannel

Cry_lairon_Ch6:
	dutycycle $2
	sound __, 2, $78, 1859
	sound __, 2, $68, 1859
	sound __, 2, $88, 1890
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $98, 1890
	sound __, 2, $68, 1916
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	dutycycle $3
	sound __, 2, $88, 1890
	dutycycle $0
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $08, 0
	sound __, 2, $88, 1883
	sound __, 2, $08, 0
	dutycycle $3
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	dutycycle $0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $68, 1862
	sound __, 2, $08, 0
	sound __, 2, $38, 1893
	dutycycle $0
	sound __, 2, $08, 0
	dutycycle $3
	sound __, 1, $08, 0
	endchannel

Cry_lairon_Ch8:
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $c8, 75
	noise __, 2, $f8, 75
	noise __, 2, $98, 75
	noise __, 2, $38, 75
	noise __, 1, $08, 75
	endchannel

Cry_Flygon:
	musicheader 3, 5, Cry_flygon_Ch5
	musicheader 1, 6, Cry_flygon_Ch6
	musicheader 1, 8, Cry_flygon_Ch8

Cry_flygon_Ch5:
	dutycycle $2
	sound __, 2, $d8, 1249
	sound __, 2, $d8, 1218
	sound __, 2, $d8, 1372
	sound __, 2, $b8, 1379
	dutycycle $3
	sound __, 2, $b8, 1418
	dutycycle $2
	sound __, 2, $a8, 1430
	sound __, 2, $98, 1412
	sound __, 2, $a8, 1762
	dutycycle $1
	sound __, 2, $c8, 1463
	dutycycle $2
	sound __, 2, $d8, 1468
	sound __, 2, $d8, 1473
	dutycycle $1
	sound __, 2, $c8, 1478
	sound __, 2, $c8, 1478
	sound __, 2, $c8, 1478
	sound __, 2, $c8, 1478
	dutycycle $0
	sound __, 2, $d8, 1478
	sound __, 2, $d8, 1478
	dutycycle $1
	sound __, 2, $d8, 1478
	sound __, 2, $d8, 1478
	sound __, 2, $c8, 1497
	dutycycle $2
	sound __, 2, $a8, 1749
	sound __, 2, $a8, 1747
	sound __, 2, $c8, 1524
	dutycycle $1
	sound __, 2, $d8, 1544
	dutycycle $2
	sound __, 2, $d8, 1625
	sound __, 2, $d8, 1511
	sound __, 2, $d8, 1532
	sound __, 2, $d8, 1532
	sound __, 2, $d8, 1739
	dutycycle $1
	sound __, 2, $b8, 1742
	dutycycle $2
	sound __, 2, $a8, 1746
	dutycycle $1
	sound __, 2, $78, 1405
	sound __, 2, $48, 1641
	dutycycle $3
	sound __, 2, $18, 1754
	dutycycle $2
	sound __, 2, $28, 1770
	dutycycle $1
	sound __, 2, $48, 1641
	dutycycle $3
	sound __, 2, $18, 1643
	endchannel

Cry_flygon_Ch6:
	dutycycle $0
	sound __, 2, $58, 1915
	sound __, 2, $78, 1911
	dutycycle $2
	sound __, 2, $48, 1866
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $38, 1807
	dutycycle $0
	sound __, 2, $48, 1838
	sound __, 2, $58, 1834
	sound __, 2, $48, 1835
	sound __, 2, $48, 1835
	sound __, 2, $48, 1835
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $48, 1822
	dutycycle $2
	sound __, 2, $48, 1858
	dutycycle $1
	sound __, 2, $58, 1844
	dutycycle $3
	sound __, 2, $68, 1844
	dutycycle $2
	sound __, 2, $48, 1788
	dutycycle $3
	sound __, 2, $48, 1602
	dutycycle $2
	sound __, 2, $38, 1519
	dutycycle $3
	sound __, 2, $68, 1458
	dutycycle $0
	sound __, 2, $68, 1418
	dutycycle $3
	sound __, 2, $68, 1540
	sound __, 2, $58, 1692
	dutycycle $2
	sound __, 2, $68, 1705
	sound __, 2, $68, 1745
	dutycycle $1
	sound __, 2, $68, 1783
	dutycycle $0
	sound __, 2, $48, 1789
	sound __, 2, $48, 1789
	dutycycle $2
	sound __, 2, $38, 1784
	dutycycle $3
	sound __, 2, $18, 1803
	dutycycle $0
	sound __, 2, $18, 1873
	dutycycle $2
	sound __, 2, $18, 1903
	dutycycle $3
	sound __, 2, $28, 1463
	dutycycle $2
	sound __, 2, $18, 1602
	endchannel

Cry_flygon_Ch8:
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $c8, 75
	noise __, 2, $c8, 75
	noise __, 2, $c8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $c8, 75
	noise __, 2, $b8, 75
	noise __, 2, $f8, 75
	noise __, 2, $e8, 75
	noise __, 2, $e8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $c8, 75
	noise __, 2, $c8, 75
	noise __, 2, $98, 75
	noise __, 2, $68, 75
	noise __, 2, $38, 75
	noise __, 2, $38, 75
	noise __, 2, $68, 75
	noise __, 2, $38, 75
	endchannel

Cry_Vibrava:
	musicheader 3, 5, Cry_vibrava_Ch5
	musicheader 1, 6, Cry_vibrava_Ch6
	musicheader 1, 8, Cry_vibrava_Ch8

Cry_vibrava_Ch5:
	dutycycle $1
	sound __, 1, $d8, 1841
	dutycycle $2
	sound __, 1, $d8, 1837
	sound __, 1, $98, 1918
	sound __, 1, $d8, 1929
	sound __, 1, $d8, 1926
	dutycycle $0
	sound __, 1, $d8, 1669
	dutycycle $2
	sound __, 1, $d8, 1701
	dutycycle $3
	sound __, 1, $d8, 1827
	dutycycle $0
	sound __, 1, $d8, 1789
	dutycycle $2
	sound __, 1, $98, 1939
	sound __, 1, $d8, 1942
	sound __, 1, $b8, 1943
	dutycycle $0
	sound __, 1, $68, 1519
	dutycycle $2
	sound __, 1, $68, 1939
	sound __, 1, $58, 1942
	dutycycle $1
	sound __, 1, $88, 1937
	dutycycle $2
	sound __, 1, $d8, 1852
	dutycycle $3
	sound __, 1, $d8, 1858
	dutycycle $2
	sound __, 1, $d8, 1935
	dutycycle $0
	sound __, 1, $d8, 1671
	dutycycle $2
	sound __, 1, $d8, 1943
	sound __, 1, $d8, 1703
	sound __, 1, $d8, 1934
	sound __, 1, $98, 1939
	sound __, 1, $d8, 1941
	sound __, 1, $98, 1943
	sound __, 1, $68, 1872
	sound __, 1, $58, 1927
	sound __, 1, $58, 1942
	sound __, 1, $68, 1943
	dutycycle $1
	sound __, 1, $88, 1832
	sound __, 1, $88, 1835
	dutycycle $0
	sound __, 1, $68, 1552
	dutycycle $1
	sound __, 1, $78, 1540
	dutycycle $0
	sound __, 1, $48, 1812
	dutycycle $2
	sound __, 1, $38, 1936
	dutycycle $0
	sound __, 1, $38, 1596
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_vibrava_Ch6:
	dutycycle $2
	sound __, 1, $68, 1900
	dutycycle $3
	sound __, 1, $68, 1898
	sound __, 1, $58, 1899
	sound __, 1, $78, 1844
	dutycycle $2
	sound __, 1, $68, 1848
	dutycycle $0
	sound __, 1, $88, 1831
	sound __, 1, $58, 1801
	sound __, 1, $78, 1773
	dutycycle $3
	sound __, 1, $88, 1836
	dutycycle $0
	sound __, 1, $68, 1851
	dutycycle $2
	sound __, 1, $68, 1889
	dutycycle $3
	sound __, 1, $68, 1898
	dutycycle $2
	sound __, 1, $38, 1877
	sound __, 1, $38, 1927
	dutycycle $0
	sound __, 1, $28, 1861
	dutycycle $3
	sound __, 1, $58, 1903
	dutycycle $2
	sound __, 1, $78, 1906
	dutycycle $0
	sound __, 1, $68, 1822
	dutycycle $3
	sound __, 1, $68, 1844
	dutycycle $2
	sound __, 1, $68, 1851
	dutycycle $0
	sound __, 1, $68, 1902
	dutycycle $2
	sound __, 1, $78, 1935
	dutycycle $0
	sound __, 1, $68, 1873
	sound __, 1, $48, 1851
	dutycycle $3
	sound __, 1, $68, 1861
	sound __, 1, $58, 1898
	dutycycle $2
	sound __, 1, $38, 1942
	sound __, 1, $28, 1939
	sound __, 1, $28, 1932
	dutycycle $3
	sound __, 1, $28, 1916
	dutycycle $2
	sound __, 1, $48, 1912
	sound __, 1, $38, 1906
	sound __, 1, $38, 1925
	dutycycle $3
	sound __, 1, $38, 1933
	dutycycle $2
	sound __, 1, $28, 1938
	sound __, 1, $28, 1888
	sound __, 1, $28, 1932
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_vibrava_Ch8:
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $38, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $38, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $48, 75
	noise __, 1, $38, 75
	noise __, 1, $48, 75
	noise __, 1, $38, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $18, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $18, 75
	noise __, 1, $18, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	endchannel

Cry_Riolu:
	musicheader 3, 5, Cry_riolu_Ch5
	musicheader 1, 6, Cry_riolu_Ch6
	musicheader 1, 8, Cry_riolu_Ch8

Cry_riolu_Ch5:
	dutycycle $1
	sound __, 2, $98, 1891
	dutycycle $2
	sound __, 2, $d8, 1923
	sound __, 2, $d8, 1922
	sound __, 2, $d8, 1928
	sound __, 2, $88, 1920
	sound __, 2, $98, 1918
	sound __, 2, $38, 1922
	sound __, 2, $98, 1950
	sound __, 2, $c8, 1969
	sound __, 2, $d8, 1973
	sound __, 2, $68, 1970
	sound __, 2, $28, 1973
	endchannel

Cry_riolu_Ch6:
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $58, 1963
	sound __, 2, $78, 1963
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $38, 1877
	sound __, 2, $28, 1936
	sound __, 2, $38, 1972
	sound __, 2, $68, 1949
	sound __, 2, $08, 0
	sound __, 2, $38, 1961
	sound __, 2, $28, 1962
	endchannel

Cry_riolu_Ch8:
	noise __, 2, $18, 44
	noise __, 2, $08, 44
	noise __, 2, $08, 44
	noise __, 2, $08, 44
	noise __, 2, $08, 44
	noise __, 2, $08, 44
	noise __, 2, $08, 44
	noise __, 2, $28, 44
	noise __, 2, $18, 44
	noise __, 2, $08, 44
	noise __, 2, $08, 44
	noise __, 2, $08, 44
	endchannel

Cry_Lucario:
	musicheader 4, 5, Cry_lucario_Ch5
	musicheader 3, 6, Cry_lucario_Ch6
	musicheader 2, 7, Cry_lucario_Ch7
	musicheader 1, 8, Cry_lucario_Ch8

Cry_lucario_Ch5:
	sound_duty 2, 2, 1, 1
	sound __, 3, $e8, 1975
	sound __, 3, $e8, 1905
	sound __, 3, $e8, 1918
	sound __, 3, $e8, 1922
	sound __, 3, $c8, 1680
	sound __, 3, $d8, 368
	sound __, 3, $d8, 368
	sound __, 3, $b8, 368
	sound __, 3, $b8, 1847
	sound __, 3, $a8, 1638
	sound __, 3, $98, 368
	sound __, 3, $68, 1699
	sound __, 2, $28, 1712
	endchannel

Cry_lucario_Ch6:
	sound_duty 0, 3, 0, 3
	sound __, 3, $b8, 1920
	sound __, 3, $b8, 1939
	sound __, 3, $b8, 1928
	sound __, 3, $b8, 1880
	sound __, 3, $a8, 1823
	sound __, 3, $a8, 1832
	sound __, 3, $b8, 1836
	sound __, 3, $98, 1841
	sound __, 3, $88, 1714
	sound __, 3, $88, 1841
	sound __, 3, $78, 1841
	sound __, 3, $48, 1728
	sound __, 2, $28, 1600
	endchannel

Cry_lucario_Ch7:
	sound __, 3, $21, 2012
	sound __, 3, $22, 1977
	sound __, 3, $22, 1983
	sound __, 3, $21, 1985
	sound __, 3, $23, 1864
	sound __, 3, $28, 1208
	sound __, 3, $27, 1208
	sound __, 3, $29, 1208
	sound __, 3, $21, 1948
	sound __, 3, $26, 1843
	sound __, 3, $29, 1208
	sound __, 3, $31, 1874
	sound __, 2, $32, 1880
	endchannel

Cry_lucario_Ch8:
	noise __, 6, $a3, 76
	noise __, 6, $b2, 76
	noise __, 6, $93, 92
	noise __, 6, $92, 92
	noise __, 6, $83, 92
	noise __, 6, $71, 92
	noise __, 2, $21, 92
	endchannel
