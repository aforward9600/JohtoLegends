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
	sound_duty 1, 1, 2, 2
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
	sound_duty 3, 0, 3, 0
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

Cry_Altaria:
	musicheader 4, 5, Cry_altaria_Ch5
	musicheader 3, 6, Cry_altaria_Ch6
	musicheader 2, 7, Cry_altaria_Ch7
	musicheader 1, 8, Cry_altaria_Ch8

Cry_altaria_Ch5:
	dutycycle $2
	sound __, 2, $48, 1998
	sound __, 1, $48, 1901
	sound __, 1, $48, 1898
	sound __, 1, $48, 2004
	sound __, 1, $48, 1899
	sound __, 1, $48, 2005
	sound __, 1, $48, 2004
	sound __, 1, $48, 1896
	sound __, 1, $48, 1900
	sound __, 1, $48, 2004
	sound __, 1, $48, 1899
	sound __, 1, $58, 1897
	sound __, 1, $48, 1994
	sound __, 1, $48, 1993
	sound __, 1, $58, 1894
	sound __, 1, $48, 1996
	sound __, 1, $48, 1992
	sound __, 1, $48, 1895
	sound __, 1, $48, 1897
	dutycycle $0
	sound __, 1, $48, 1895
	dutycycle $2
	sound __, 1, $48, 1898
	sound __, 1, $48, 1899
	dutycycle $3
	sound __, 1, $48, 1897
	dutycycle $2
	sound __, 2, $38, 1899
	sound __, 1, $28, 2004
	sound __, 1, $28, 1898
	sound __, 2, $18, 1898
	sound __, 1, $08, 0
	endchannel

Cry_altaria_Ch6:
	dutycycle $2
	sound __, 1, $68, 2004
	sound __, 1, $88, 2004
	sound __, 1, $78, 2004
	sound __, 1, $68, 2005
	sound __, 2, $08, 0
	sound __, 1, $88, 1996
	sound __, 1, $58, 1996
	sound __, 2, $68, 2005
	sound __, 1, $08, 0
	sound __, 1, $88, 1994
	sound __, 1, $68, 1993
	sound __, 4, $08, 0
	sound __, 1, $58, 1997
	sound __, 1, $78, 1997
	sound __, 1, $58, 1996
	sound __, 1, $78, 1997
	sound __, 1, $08, 0
	sound __, 1, $88, 1990
	sound __, 1, $78, 1991
	sound __, 1, $48, 1991
	sound __, 1, $08, 0
	sound __, 1, $48, 1989
	sound __, 1, $38, 1990
	sound __, 1, $38, 1988
	sound __, 2, $08, 0
	endchannel

Cry_altaria_Ch7:
	sound __, 2, $11, 2023
	sound __, 1, $15, 1975
	sound __, 1, $14, 1973
	sound __, 1, $11, 2026
	sound __, 1, $10, 1974
	sound __, 1, $11, 2027
	sound __, 1, $11, 2026
	sound __, 1, $15, 1972
	sound __, 1, $15, 1974
	sound __, 1, $11, 2026
	sound __, 1, $10, 1974
	sound __, 1, $10, 1973
	sound __, 2, $11, 2021
	sound __, 1, $13, 1971
	sound __, 1, $11, 2022
	sound __, 1, $11, 2020
	sound __, 1, $15, 1972
	sound __, 1, $11, 1973
	sound __, 1, $13, 1972
	sound __, 1, $13, 1973
	sound __, 1, $13, 1974
	sound __, 1, $13, 1973
	sound __, 1, $19, 1974
	sound __, 1, $13, 1974
	sound __, 1, $11, 2026
	sound __, 1, $25, 1973
	sound __, 1, $29, 1973
	sound __, 1, $33, 1973
	sound __, 1, $31, 2026
	endchannel

Cry_altaria_Ch8:
	noise __, 1, $48, 92
	noise __, 1, $38, 92
	noise __, 1, $48, 92
	noise __, 3, $38, 92
	noise __, 1, $48, 92
	noise __, 2, $38, 92
	noise __, 1, $48, 92
	noise __, 1, $38, 92
	noise __, 2, $48, 92
	noise __, 2, $38, 92
	noise __, 2, $48, 92
	noise __, 1, $38, 92
	noise __, 1, $48, 92
	noise __, 2, $38, 92
	noise __, 2, $48, 92
	noise __, 2, $38, 92
	noise __, 4, $28, 92
	noise __, 2, $18, 92
	endchannel

Cry_Swablu:
	musicheader 3, 5, Cry_swablu_Ch5
	musicheader 1, 7, Cry_swablu_Ch7
	musicheader 1, 8, Cry_swablu_Ch8

Cry_swablu_Ch5:
	dutycycle $2
	sound __, 1, $d8, 2004
	sound __, 1, $d8, 2003
	sound __, 1, $98, 2003
	sound __, 1, $d8, 2003
	sound __, 1, $d8, 2004
	sound __, 1, $98, 2005
	sound __, 2, $d8, 2003
	sound __, 1, $98, 2006
	sound __, 1, $d8, 2004
	sound __, 1, $c8, 2005
	sound __, 1, $88, 2016
	sound __, 1, $b8, 2016
	sound __, 1, $68, 2015
	sound __, 1, $38, 2015
	sound __, 1, $18, 2015
	endchannel

Cry_swablu_Ch7:
	sound __, 8, $11, 2026
	sound __, 3, $11, 2027
	sound __, 1, $12, 2017
	sound __, 1, $11, 2017
	sound __, 2, $21, 2032
	sound __, 1, $31, 2032
	endchannel

Cry_swablu_Ch8:
	noise __, 2, $b8, 100
	noise __, 1, $88, 100
	noise __, 2, $b8, 100
	noise __, 1, $78, 100
	noise __, 1, $c8, 100
	noise __, 1, $b8, 100
	noise __, 1, $88, 100
	noise __, 1, $b8, 100
	noise __, 1, $a8, 100
	noise __, 1, $68, 100
	noise __, 1, $98, 100
	noise __, 1, $58, 100
	noise __, 1, $38, 100
	noise __, 1, $18, 100
	endchannel

Cry_Salamence:
	musicheader 4, 5, Cry_salamence_Ch5
	musicheader 3, 6, Cry_salamence_Ch6
	musicheader 2, 7, Cry_salamence_Ch7
	musicheader 1, 8, Cry_salamence_Ch8

Cry_salamence_Ch5:
	sound_duty 1, 1, 2, 2
	sound __, 3, $d8, 1703
	sound __, 3, $c8, 1736
	sound __, 3, $d8, 1708
	sound __, 3, $b8, 1875
	sound __, 3, $c8, 1694
	sound __, 3, $c8, 1008
	sound __, 3, $b8, 1801
	sound __, 3, $88, 1791
	sound __, 3, $88, 1519
	sound __, 3, $98, 1769
	sound __, 3, $98, 1614
	sound __, 3, $a8, 1776
	sound __, 3, $b8, 1776
	sound __, 3, $c8, 1769
	sound __, 3, $c8, 1760
	sound __, 3, $b8, 1620
	sound __, 3, $e8, 1746
	sound __, 3, $c8, 1602
	sound __, 3, $b8, 1583
	sound __, 3, $b8, 1532
	sound __, 3, $b8, 1463
	sound __, 3, $98, 1239
	sound __, 3, $58, 1488
	sound __, 2, $28, 1208
	endchannel

Cry_salamence_Ch6:
	sound_duty 3, 0, 3, 0
	sound __, 3, $a8, 1845
	sound __, 3, $98, 1871
	sound __, 3, $a8, 1602
	sound __, 3, $88, 1846
	sound __, 3, $98, 1848
	sound __, 3, $98, 1864
	sound __, 3, $88, 1856
	sound __, 3, $68, 1707
	sound __, 3, $68, 1577
	sound __, 3, $78, 1608
	sound __, 3, $78, 1770
	sound __, 3, $88, 1945
	sound __, 3, $88, 1941
	sound __, 3, $98, 1643
	sound __, 3, $a8, 1617
	sound __, 3, $98, 1577
	sound __, 3, $b8, 1662
	sound __, 3, $a8, 1555
	sound __, 3, $98, 1559
	sound __, 3, $98, 1343
	sound __, 3, $88, 1485
	sound __, 3, $78, 1358
	sound __, 3, $48, 1540
	sound __, 2, $28, 1024
	endchannel

Cry_salamence_Ch7:
	sound __, 3, $26, 1876
	sound __, 3, $26, 1892
	sound __, 3, $24, 1878
	sound __, 3, $23, 1962
	sound __, 3, $24, 1871
	sound __, 3, $27, 1528
	sound __, 3, $29, 1925
	sound __, 3, $35, 1920
	sound __, 3, $37, 1784
	sound __, 3, $23, 1909
	sound __, 3, $27, 1831
	sound __, 3, $23, 1912
	sound __, 3, $29, 1912
	sound __, 3, $23, 1909
	sound __, 3, $24, 1904
	sound __, 3, $27, 1834
	sound __, 3, $22, 1897
	sound __, 3, $22, 1825
	sound __, 3, $28, 1816
	sound __, 3, $26, 1790
	sound __, 3, $29, 1756
	sound __, 3, $22, 1644
	sound __, 3, $35, 1768
	sound __, 2, $36, 1628
	endchannel

Cry_salamence_Ch8:
	noise __, 6, $f1, 76
	noise __, 6, $b8, 92
	noise __, 6, $b8, 92
	noise __, 6, $a2, 92
	noise __, 6, $98, 92
	noise __, 6, $a8, 92
	noise __, 6, $c8, 92
	noise __, 6, $c2, 76
	noise __, 6, $b3, 76
	noise __, 6, $b3, 68
	noise __, 6, $91, 108
	noise __, 5, $51, 108
	endchannel

Cry_Bagon:
	musicheader 4, 5, Cry_bagon_Ch5
	musicheader 3, 6, Cry_bagon_Ch6
	musicheader 2, 7, Cry_bagon_Ch7
	musicheader 1, 8, Cry_bagon_Ch8

Cry_bagon_Ch5:
	dutycycle $3
	sound __, 1, $58, 1620
	dutycycle $1
	sound __, 1, $58, 1617
	dutycycle $2
	sound __, 1, $48, 1762
	sound __, 2, $58, 1614
	dutycycle $3
	sound __, 1, $58, 1947
	dutycycle $2
	sound __, 1, $58, 1862
	sound __, 1, $58, 1860
	dutycycle $1
	sound __, 1, $48, 1768
	dutycycle $2
	sound __, 1, $48, 1890
	sound __, 1, $58, 1913
	sound __, 1, $48, 1913
	sound __, 1, $48, 1837
	sound __, 2, $58, 1913
	sound __, 1, $48, 1836
	sound __, 1, $58, 1913
	sound __, 1, $48, 1913
	dutycycle $3
	sound __, 1, $48, 1580
	dutycycle $2
	sound __, 1, $48, 1809
	dutycycle $1
	sound __, 1, $38, 1596
	sound __, 1, $18, 1602
	endchannel

Cry_bagon_Ch6:
	dutycycle $2
	sound __, 1, $98, 1746
	dutycycle $3
	sound __, 1, $a8, 1743
	sound __, 1, $08, 0
	dutycycle $2
	sound __, 2, $88, 1767
	sound __, 3, $08, 0
	sound __, 1, $78, 1846
	dutycycle $3
	sound __, 1, $88, 1848
	dutycycle $2
	sound __, 1, $78, 1860
	sound __, 1, $88, 1860
	sound __, 1, $08, 0
	sound __, 1, $88, 1893
	sound __, 1, $78, 1897
	sound __, 1, $08, 0
	sound __, 1, $98, 1859
	sound __, 1, $88, 1859
	sound __, 1, $08, 0
	sound __, 1, $68, 1648
	sound __, 1, $58, 1636
	sound __, 1, $38, 1641
	endchannel

Cry_bagon_Ch7:
	sound __, 1, $16, 1834
	sound __, 1, $16, 1833
	sound __, 1, $17, 1905
	sound __, 1, $14, 1831
	sound __, 1, $13, 1831
	sound __, 1, $10, 1998
	sound __, 1, $14, 1955
	sound __, 1, $13, 1954
	sound __, 1, $16, 1908
	sound __, 1, $13, 1969
	sound __, 2, $13, 1981
	sound __, 1, $13, 1943
	sound __, 1, $14, 1981
	sound __, 1, $13, 1981
	sound __, 1, $13, 1942
	sound __, 2, $14, 1981
	sound __, 1, $13, 1814
	sound __, 1, $11, 1929
	sound __, 1, $16, 1822
	sound __, 1, $22, 1825
	endchannel

Cry_bagon_Ch8:
	noise __, 3, $48, 92
	noise __, 4, $38, 92
	noise __, 2, $48, 92
	noise __, 2, $38, 92
	noise __, 7, $48, 92
	noise __, 1, $38, 92
	noise __, 1, $48, 92
	noise __, 1, $38, 92
	noise __, 1, $28, 92
	endchannel

Cry_Shelgon:
	musicheader 3, 5, Cry_shelgon_Ch5
	musicheader 1, 6, Cry_shelgon_Ch6
	musicheader 1, 8, Cry_shelgon_Ch8

Cry_shelgon_Ch5:
	dutycycle $2
	sound __, 2, $d8, 1548
	sound __, 2, $d8, 1552
	dutycycle $1
	sound __, 2, $d8, 1336
	sound __, 2, $d8, 1295
	dutycycle $2
	sound __, 2, $d8, 1580
	sound __, 2, $d8, 1605
	dutycycle $1
	sound __, 2, $d8, 1608
	dutycycle $3
	sound __, 2, $d8, 1599
	dutycycle $2
	sound __, 2, $d8, 1829
	sound __, 2, $d8, 1851
	dutycycle $1
	sound __, 2, $d8, 1847
	dutycycle $2
	sound __, 2, $d8, 1753
	sound __, 2, $d8, 1816
	sound __, 2, $d8, 1827
	sound __, 2, $d8, 1864
	dutycycle $0
	sound __, 2, $c8, 1904
	sound __, 2, $b8, 1827
	dutycycle $2
	sound __, 2, $d8, 1827
	dutycycle $1
	sound __, 2, $d8, 1921
	dutycycle $2
	sound __, 2, $d8, 1843
	sound __, 2, $d8, 1844
	sound __, 2, $d8, 1540
	sound __, 2, $b8, 1540
	sound __, 2, $c8, 1552
	sound __, 2, $c8, 1478
	sound __, 2, $88, 1488
	sound __, 2, $38, 1641
	sound __, 2, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_shelgon_Ch6:
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $68, 1727
	sound __, 2, $68, 1720
	sound __, 2, $68, 1737
	sound __, 2, $58, 1622
	sound __, 2, $48, 1515
	dutycycle $3
	sound __, 2, $68, 1519
	dutycycle $1
	sound __, 2, $58, 1519
	dutycycle $3
	sound __, 2, $68, 1651
	dutycycle $2
	sound __, 2, $68, 1794
	dutycycle $0
	sound __, 2, $68, 1779
	sound __, 2, $58, 1779
	dutycycle $2
	sound __, 2, $68, 1778
	sound __, 2, $68, 1863
	dutycycle $0
	sound __, 2, $68, 1825
	dutycycle $1
	sound __, 2, $68, 1878
	dutycycle $2
	sound __, 2, $68, 1891
	sound __, 2, $68, 1885
	dutycycle $0
	sound __, 2, $78, 1844
	dutycycle $2
	sound __, 2, $68, 1817
	sound __, 2, $68, 1819
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	dutycycle $3
	sound __, 2, $68, 1493
	dutycycle $2
	sound __, 2, $48, 1628
	sound __, 2, $38, 1633
	dutycycle $3
	sound __, 2, $18, 1497
	sound __, 2, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_shelgon_Ch8:
	noise __, 2, $d8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $88, 75
	noise __, 2, $a8, 75
	noise __, 2, $98, 75
	noise __, 2, $c8, 75
	noise __, 2, $c8, 75
	noise __, 2, $e8, 75
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
	noise __, 2, $d8, 75
	noise __, 2, $e8, 75
	noise __, 2, $88, 75
	noise __, 2, $78, 75
	noise __, 2, $28, 75
	noise __, 2, $08, 75
	noise __, 1, $08, 75
	endchannel

Cry_Metang:
	musicheader 3, 5, Cry_metang_Ch5
	musicheader 1, 6, Cry_metang_Ch6
	musicheader 1, 8, Cry_metang_Ch8

Cry_metang_Ch5:
	dutycycle $2
	sound __, 2, $d8, 1893
	sound __, 2, $d8, 1894
	sound __, 2, $d8, 1895
	dutycycle $1
	sound __, 2, $d8, 1008
	dutycycle $2
	sound __, 2, $d8, 1941
	sound __, 2, $d8, 1907
	sound __, 2, $d8, 1909
	sound __, 2, $d8, 1908
	sound __, 2, $d8, 1913
	sound __, 2, $d8, 1951
	sound __, 2, $d8, 1950
	sound __, 2, $d8, 1955
	sound __, 2, $d8, 1955
	sound __, 2, $d8, 1919
	dutycycle $1
	sound __, 2, $d8, 1921
	dutycycle $2
	sound __, 2, $d8, 1920
	sound __, 2, $d8, 1921
	dutycycle $0
	sound __, 2, $d8, 1452
	dutycycle $1
	sound __, 2, $d8, 1620
	dutycycle $0
	sound __, 2, $b8, 1643
	sound __, 2, $98, 1239
	dutycycle $1
	sound __, 2, $88, 1239
	sound __, 2, $68, 1239
	dutycycle $2
	sound __, 2, $48, 1909
	sound __, 2, $28, 1904
	dutycycle $1
	sound __, 2, $18, 1552
	sound __, 1, $08, 0
	endchannel

Cry_metang_Ch6:
	dutycycle $2
	sound __, 2, $68, 1959
	sound __, 2, $58, 1959
	sound __, 2, $68, 1960
	sound __, 2, $48, 1959
	sound __, 2, $68, 1963
	sound __, 2, $58, 1963
	sound __, 2, $58, 1966
	sound __, 2, $68, 1966
	sound __, 2, $68, 1950
	sound __, 2, $58, 1923
	sound __, 2, $58, 1921
	dutycycle $3
	sound __, 2, $48, 1921
	dutycycle $2
	sound __, 2, $68, 1919
	dutycycle $1
	sound __, 2, $58, 1877
	dutycycle $0
	sound __, 2, $48, 1899
	dutycycle $2
	sound __, 2, $48, 1933
	sound __, 2, $48, 1933
	sound __, 2, $68, 1926
	sound __, 2, $78, 1914
	sound __, 2, $58, 1915
	dutycycle $3
	sound __, 2, $48, 1913
	dutycycle $2
	sound __, 2, $38, 1910
	sound __, 2, $38, 1908
	sound __, 2, $18, 1947
	sound __, 2, $18, 1963
	sound __, 2, $18, 1963
	sound __, 1, $08, 0
	endchannel

Cry_metang_Ch8:
	noise __, 2, $88, 75
	noise __, 2, $88, 75
	noise __, 2, $c8, 75
	noise __, 2, $e8, 75
	noise __, 2, $98, 75
	noise __, 2, $c8, 75
	noise __, 2, $98, 75
	noise __, 2, $e8, 75
	noise __, 2, $d8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $f8, 75
	noise __, 2, $e8, 75
	noise __, 2, $e8, 75
	noise __, 2, $e8, 75
	noise __, 2, $f8, 75
	noise __, 2, $e8, 75
	noise __, 2, $f8, 75
	noise __, 2, $c8, 75
	noise __, 2, $88, 75
	noise __, 2, $58, 75
	noise __, 2, $48, 75
	noise __, 2, $28, 75
	noise __, 2, $38, 75
	noise __, 1, $08, 75
	endchannel

Cry_Beldum:
	musicheader 3, 5, Cry_beldum_Ch5
	musicheader 1, 6, Cry_beldum_Ch6
	musicheader 1, 8, Cry_beldum_Ch8

Cry_beldum_Ch5:
	dutycycle $1
	sound __, 2, $d8, 1532
	dutycycle $0
	sound __, 2, $98, 1515
	dutycycle $2
	sound __, 2, $a8, 1961
	dutycycle $3
	sound __, 2, $c8, 1962
	dutycycle $2
	sound __, 2, $88, 1526
	dutycycle $1
	sound __, 2, $d8, 1528
	dutycycle $0
	sound __, 2, $78, 1511
	dutycycle $2
	sound __, 2, $b8, 1961
	dutycycle $1
	sound __, 2, $c8, 1962
	dutycycle $2
	sound __, 2, $98, 1964
	dutycycle $3
	sound __, 2, $a8, 1524
	dutycycle $0
	sound __, 2, $28, 1511
	sound __, 2, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_beldum_Ch6:
	dutycycle $2
	sound __, 2, $68, 1966
	dutycycle $0
	sound __, 2, $48, 1961
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $68, 1963
	sound __, 2, $08, 0
	sound __, 2, $68, 1965
	dutycycle $3
	sound __, 2, $38, 1961
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $68, 1963
	dutycycle $0
	sound __, 2, $38, 1943
	dutycycle $2
	sound __, 2, $48, 1965
	dutycycle $3
	sound __, 2, $18, 1961
	sound __, 2, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_beldum_Ch8:
	noise __, 2, $f8, 75
	noise __, 2, $c8, 75
	noise __, 2, $c8, 75
	noise __, 2, $f8, 75
	noise __, 2, $98, 75
	noise __, 2, $f8, 75
	noise __, 2, $98, 75
	noise __, 2, $c8, 75
	noise __, 2, $f8, 75
	noise __, 2, $b8, 75
	noise __, 2, $c8, 75
	noise __, 2, $38, 75
	noise __, 2, $08, 75
	noise __, 1, $08, 75
	endchannel

Cry_Gible:
	musicheader 3, 5, Cry_gible_Ch5
	musicheader 1, 6, Cry_gible_Ch6
	musicheader 1, 8, Cry_gible_Ch8

Cry_gible_Ch5:
	dutycycle $2
	sound __, 2, $d8, 1929
	sound __, 2, $d8, 1929
	dutycycle $0
	sound __, 2, $d8, 1926
	sound __, 2, $d8, 1924
	dutycycle $2
	sound __, 2, $d8, 1924
	sound __, 2, $d8, 1922
	sound __, 2, $d8, 1917
	sound __, 2, $d8, 1914
	sound __, 2, $78, 1799
	sound __, 2, $68, 1751
	sound __, 2, $58, 1857
	sound __, 1, $08, 0
	endchannel

Cry_gible_Ch6:
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $58, 1832
	sound __, 2, $08, 0
	sound __, 2, $38, 1830
	sound __, 1, $08, 0
	endchannel

Cry_gible_Ch8:
	noise __, 2, $48, 75
	noise __, 2, $38, 75
	noise __, 2, $28, 75
	noise __, 2, $28, 75
	noise __, 2, $28, 75
	noise __, 2, $38, 75
	noise __, 2, $28, 75
	noise __, 2, $48, 75
	noise __, 2, $28, 75
	noise __, 2, $28, 75
	noise __, 2, $18, 75
	noise __, 1, $08, 75
	endchannel

Cry_Gabite:
	musicheader 3, 5, Cry_gabite_Ch5
	musicheader 1, 6, Cry_gabite_Ch6
	musicheader 1, 8, Cry_gabite_Ch8

Cry_gabite_Ch5:
	dutycycle $2
	sound __, 2, $d8, 1540
	sound __, 2, $d8, 1940
	sound __, 2, $d8, 1950
	dutycycle $1
	sound __, 2, $d8, 1959
	dutycycle $2
	sound __, 2, $d8, 1962
	sound __, 2, $d8, 1963
	sound __, 2, $d8, 1967
	sound __, 2, $d8, 1966
	sound __, 2, $d8, 1667
	sound __, 2, $d8, 1754
	sound __, 2, $d8, 1740
	sound __, 2, $d8, 1785
	sound __, 2, $d8, 1783
	sound __, 2, $d8, 1783
	sound __, 2, $d8, 1837
	sound __, 2, $c8, 1828
	endchannel

Cry_gabite_Ch6:
	dutycycle $2
	sound __, 2, $68, 1935
	sound __, 2, $78, 1930
	sound __, 2, $68, 1940
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	dutycycle $1
	sound __, 2, $48, 1867
	sound __, 2, $08, 0
	sound __, 2, $58, 1844
	dutycycle $2
	sound __, 2, $68, 1818
	sound __, 2, $68, 1865
	sound __, 2, $98, 1862
	sound __, 2, $68, 1746
	dutycycle $1
	sound __, 2, $58, 1722
	endchannel

Cry_gabite_Ch8:
	noise __, 2, $58, 44
	noise __, 2, $68, 44
	noise __, 2, $58, 44
	noise __, 2, $38, 44
	noise __, 2, $28, 44
	noise __, 2, $58, 44
	noise __, 2, $48, 44
	noise __, 2, $48, 44
	noise __, 2, $48, 44
	noise __, 2, $58, 44
	noise __, 2, $58, 44
	noise __, 2, $48, 44
	noise __, 2, $48, 44
	noise __, 2, $38, 44
	noise __, 2, $48, 44
	noise __, 2, $68, 44
	endchannel

Cry_Garchomp:
	musicheader 4, 5, Cry_Garchomp_Ch5
	musicheader 3, 6, Cry_Garchomp_Ch6
	musicheader 2, 7, Cry_Garchomp_Ch7
	musicheader 1, 8, Cry_Garchomp_Ch8

Cry_Garchomp_Ch5:
	dutycycle $2
	sound __, 1, $d8, 1365
	sound __, 1, $d8, 1912
	dutycycle $0
	sound __, 1, $d8, 1441
	dutycycle $2
	sound __, 1, $d8, 1728
	dutycycle $1
	sound __, 1, $d8, 1762
	dutycycle $2
	sound __, 1, $d8, 956
	dutycycle $0
	sound __, 1, $d8, 1478
	dutycycle $3
	sound __, 1, $d8, 1758
	dutycycle $0
	sound __, 1, $d8, 1628
	dutycycle $1
	sound __, 1, $d8, 1631
	dutycycle $0
	sound __, 1, $d8, 1483
	sound __, 1, $d8, 956
	dutycycle $1
	sound __, 1, $d8, 1763
	sound __, 1, $d8, 1536
	dutycycle $2
	sound __, 1, $d8, 1412
	sound __, 1, $d8, 1468
	sound __, 1, $d8, 1816
	sound __, 1, $d8, 1488
	sound __, 1, $d8, 1841
	sound __, 1, $d8, 1858
	sound __, 1, $d8, 1859
	sound __, 1, $d8, 1861
	dutycycle $0
	sound __, 1, $d8, 1866
	dutycycle $1
	sound __, 1, $d8, 1866
	sound __, 1, $d8, 1870
	dutycycle $2
	sound __, 1, $d8, 1386
	sound __, 1, $d8, 1528
	sound __, 1, $d8, 1876
	dutycycle $3
	sound __, 1, $d8, 1452
	dutycycle $0
	sound __, 1, $d8, 1336
	dutycycle $2
	sound __, 1, $d8, 1295
	dutycycle $0
	sound __, 1, $d8, 1405
	dutycycle $2
	sound __, 1, $d8, 1493
	dutycycle $3
	sound __, 1, $d8, 1393
	dutycycle $0
	sound __, 1, $d8, 956
	sound __, 1, $d8, 974
	dutycycle $1
	sound __, 1, $d8, 1483
	dutycycle $3
	sound __, 1, $d8, 1468
	dutycycle $2
	sound __, 1, $d8, 1473
	dutycycle $1
	sound __, 1, $d8, 1483
	dutycycle $2
	sound __, 1, $d8, 1776
	sound __, 1, $d8, 1452
	dutycycle $1
	sound __, 1, $d8, 1412
	dutycycle $2
	sound __, 1, $d8, 1399
	dutycycle $1
	sound __, 1, $d8, 1497
	sound __, 1, $d8, 1483
	sound __, 1, $d8, 1478
	dutycycle $2
	sound __, 1, $d8, 1468
	dutycycle $1
	sound __, 1, $d8, 1418
	sound __, 1, $d8, 1386
	sound __, 1, $d8, 1393
	dutycycle $2
	sound __, 1, $d8, 1447
	sound __, 1, $d8, 1386
	sound __, 1, $d8, 1436
	dutycycle $1
	sound __, 1, $c8, 1399
	sound __, 1, $78, 1320
	endchannel

Cry_Garchomp_Ch6:
	sound __, 1, $08, 0
	dutycycle $2
	sound __, 1, $88, 1898
	dutycycle $3
	sound __, 1, $88, 1892
	sound __, 2, $08, 0
	sound __, 1, $98, 1790
	dutycycle $2
	sound __, 1, $88, 1779
	sound __, 3, $08, 0
	dutycycle $0
	sound __, 1, $98, 1611
	dutycycle $2
	sound __, 1, $98, 1605
	sound __, 10, $08, 0
	sound __, 2, $68, 2003
	sound __, 1, $58, 2004
	dutycycle $3
	sound __, 1, $88, 1869
	sound __, 1, $88, 1876
	sound __, 10, $08, 0
	dutycycle $2
	sound __, 1, $98, 1532
	sound __, 1, $88, 1536
	sound __, 2, $08, 0
	dutycycle $3
	sound __, 1, $78, 1365
	dutycycle $2
	sound __, 1, $78, 1312
	sound __, 1, $08, 0
	dutycycle $1
	sound __, 1, $78, 1379
	dutycycle $2
	sound __, 1, $78, 1405
	sound __, 1, $88, 1544
	dutycycle $3
	sound __, 1, $78, 1532
	dutycycle $0
	sound __, 1, $58, 1493
	dutycycle $2
	sound __, 1, $68, 1468
	sound __, 1, $68, 1473
	sound __, 2, $08, 0
	dutycycle $0
	sound __, 1, $88, 1343
	dutycycle $2
	sound __, 1, $78, 1295
	sound __, 1, $08, 0
	endchannel

Cry_Garchomp_Ch7:
	sound __, 1, $13, 1167
	sound __, 3, $14, 1136
	sound __, 1, $17, 1274
	sound __, 1, $17, 1297
	sound __, 1, $15, 1661
	sound __, 1, $12, 1748
	sound __, 1, $14, 1961
	sound __, 1, $13, 1744
	sound __, 1, $12, 1963
	sound __, 1, $17, 1725
	sound __, 1, $12, 1938
	sound __, 1, $14, 1902
	sound __, 1, $17, 1440
	sound __, 1, $17, 1516
	sound __, 1, $15, 1740
	sound __, 1, $16, 1802
	sound __, 1, $17, 1566
	sound __, 1, $11, 1948
	sound __, 1, $11, 1949
	sound __, 1, $15, 1776
	sound __, 1, $13, 1802
	sound __, 1, $18, 1737
	sound __, 1, $14, 1744
	sound __, 1, $15, 1798
	sound __, 1, $12, 1873
	sound __, 1, $13, 1737
	sound __, 1, $11, 1960
	sound __, 1, $13, 1884
	sound __, 1, $10, 1940
	sound __, 1, $17, 1376
	sound __, 1, $11, 1940
	sound __, 1, $11, 1922
	sound __, 1, $12, 1733
	sound __, 1, $11, 1904
	sound __, 1, $16, 1425
	sound __, 1, $17, 1481
	sound __, 1, $10, 1935
	sound __, 1, $11, 1949
	sound __, 1, $12, 1716
	sound __, 1, $11, 1909
	sound __, 1, $12, 1840
	sound __, 1, $17, 1376
	sound __, 1, $17, 1358
	sound __, 1, $17, 1393
	sound __, 1, $17, 1318
	sound __, 1, $12, 1855
	sound __, 1, $13, 1837
	sound __, 1, $11, 1913
	sound __, 1, $11, 1914
	sound __, 1, $12, 1853
	sound __, 1, $13, 1913
	sound __, 1, $11, 1908
	sound __, 1, $11, 1904
	sound __, 1, $25, 1600
	endchannel

Cry_Garchomp_Ch8:
	noise __, 1, $e8, 100
	noise __, 12, $f8, 100
	noise __, 1, $e8, 100
	noise __, 11, $f8, 100
	noise __, 1, $d8, 100
	noise __, 1, $e8, 100
	noise __, 20, $f8, 100
	noise __, 1, $c8, 100
	noise __, 1, $e8, 100
	noise __, 2, $f8, 100
	noise __, 1, $e8, 100
	noise __, 1, $f8, 100
	noise __, 1, $d8, 100
	noise __, 1, $a8, 100
	noise __, 1, $68, 100
	endchannel

Cry_Mamoswine:
	musicheader 4, 5, Cry_Mamoswine_Ch5
	musicheader 3, 6, Cry_Mamoswine_Ch6
	musicheader 2, 7, Cry_Mamoswine_Ch7
	musicheader 1, 8, Cry_Mamoswine_Ch8

Cry_Mamoswine_Ch5:
	sound_duty 2, 2, 2, 2
	sound __, 3, $98, 204
	sound __, 3, $a8, 706
	sound __, 3, $88, 1915
	sound __, 3, $a8, 1805
	sound __, 3, $e8, 1824
	sound __, 3, $e8, 1834
	sound __, 3, $f8, 1847
	sound __, 3, $b8, 1850
	sound __, 3, $b8, 1166
	sound __, 3, $b8, 1154
	sound __, 3, $d8, 1656
	sound __, 3, $c8, 1651
	sound __, 3, $a8, 1651
	sound __, 3, $a8, 1721
	sound __, 3, $a8, 1742
	sound __, 3, $a8, 1653
	sound __, 3, $b8, 1656
	sound __, 3, $b8, 1652
	sound __, 3, $c8, 1615
	sound __, 3, $b8, 1646
	sound __, 3, $98, 1629
	sound __, 3, $a8, 1649
	sound __, 3, $a8, 419
	sound __, 3, $b8, 1854
	sound __, 3, $a8, 1853
	sound __, 3, $b8, 1621
	sound __, 3, $b8, 1565
	sound __, 3, $a8, 1698
	sound __, 3, $48, 1506
	sound __, 3, $28, 1306
	sound __, 3, $18, 1606
	sound __, 3, $18, 1626
	sound __, 2, $08, 0
	endchannel

Cry_Mamoswine_Ch6:
	sound_duty 2, 1, 2, 1
	sound __, 3, $98, 1619
	sound __, 3, $b8, 1636
	sound __, 3, $98, 1805
	sound __, 3, $b8, 1695
	sound __, 3, $f8, 1736
	sound __, 3, $f8, 1748
	sound __, 3, $f8, 1766
	sound __, 3, $b8, 1771
	sound __, 3, $b8, 1848
	sound __, 3, $c8, 1644
	sound __, 3, $e8, 1765
	sound __, 3, $c8, 1908
	sound __, 3, $b8, 1856
	sound __, 3, $b8, 1825
	sound __, 3, $b8, 1856
	sound __, 3, $b8, 1908
	sound __, 3, $c8, 1909
	sound __, 3, $b8, 1830
	sound __, 3, $c8, 1647
	sound __, 3, $c8, 1596
	sound __, 3, $98, 1571
	sound __, 3, $b8, 1644
	sound __, 3, $b8, 1591
	sound __, 3, $b8, 1776
	sound __, 3, $b8, 1803
	sound __, 3, $c8, 1848
	sound __, 3, $b8, 1795
	sound __, 3, $b8, 1737
	sound __, 3, $48, 1553
	sound __, 3, $38, 1337
	sound __, 3, $18, 1429
	sound __, 3, $18, 1458
	sound __, 2, $08, 0
	endchannel

Cry_Mamoswine_Ch7:
	sound __, 3, $17, 1125
	sound __, 3, $15, 1376
	sound __, 3, $21, 1981
	sound __, 3, $16, 1927
	sound __, 3, $11, 1936
	sound __, 3, $11, 1940
	sound __, 3, $11, 1947
	sound __, 3, $13, 1950
	sound __, 3, $16, 1608
	sound __, 3, $13, 1602
	sound __, 3, $12, 1852
	sound __, 3, $14, 1849
	sound __, 3, $13, 1849
	sound __, 3, $12, 1885
	sound __, 3, $16, 1895
	sound __, 3, $12, 1850
	sound __, 3, $12, 1852
	sound __, 3, $13, 1850
	sound __, 3, $16, 1832
	sound __, 3, $13, 1847
	sound __, 3, $14, 1839
	sound __, 3, $13, 1849
	sound __, 3, $17, 1235
	sound __, 3, $11, 1952
	sound __, 3, $11, 1952
	sound __, 3, $12, 1835
	sound __, 3, $16, 1806
	sound __, 3, $12, 1874
	sound __, 3, $22, 1778
	sound __, 3, $22, 1678
	sound __, 3, $21, 1827
	sound __, 3, $24, 1837
	sound __, 2, $00, 0
	endchannel

Cry_Mamoswine_Ch8:
	noise __, 6, $d6, 84
	noise __, 6, $b8, 84
	noise __, 6, $e8, 92
	noise __, 6, $e1, 92
	noise __, 6, $d3, 84
	noise __, 6, $f2, 84
	noise __, 6, $d3, 68
	noise __, 6, $d8, 92
	noise __, 6, $d5, 92
	noise __, 6, $f2, 108
	noise __, 6, $d3, 92
	noise __, 6, $b8, 92
	noise __, 6, $b8, 92
	noise __, 6, $92, 92
	noise __, 6, $61, 108
	noise __, 6, $18, 108
	noise __, 2, $08, 108
	endchannel

Cry_Yanmega:
	musicheader 4, 5, Cry_Yanmega_Ch5
	musicheader 3, 6, Cry_Yanmega_Ch6
	musicheader 2, 7, Cry_Yanmega_Ch7
	musicheader 1, 8, Cry_Yanmega_Ch8

Cry_Yanmega_Ch5:
	sound_duty 2, 2, 1, 1
	sound __, 3, $88, 1224
	sound __, 3, $b8, 1224
	sound __, 3, $a8, 1356
	sound __, 3, $98, 1301
	sound __, 3, $e8, 1255
	sound __, 3, $b8, 1111
	sound __, 3, $98, 1245
	sound __, 3, $e8, 1224
	sound __, 3, $88, 1178
	sound __, 3, $88, 1166
	sound __, 3, $b8, 1245
	sound __, 3, $98, 1334
	sound __, 3, $88, 1827
	sound __, 3, $88, 1823
	sound __, 3, $88, 1816
	sound __, 3, $88, 1823
	sound __, 3, $88, 1833
	sound __, 3, $78, 1837
	sound __, 3, $88, 1843
	sound __, 6, $88, 1851
	sound __, 3, $98, 1868
	sound __, 3, $a8, 1944
	sound __, 3, $a8, 1867
	sound __, 3, $98, 1871
	sound __, 3, $88, 1873
	sound __, 1, $68, 1202
	sound __, 2, $58, 1202
	sound __, 3, $48, 1882
	sound __, 3, $38, 1887
	sound __, 3, $18, 1889
	sound __, 3, $08, 0
	sound __, 3, $08, 0
	sound __, 5, $08, 0
	endchannel

Cry_Yanmega_Ch6:
	sound_duty 3, 0, 3, 0
	sound __, 3, $68, 1143
	sound __, 3, $98, 1235
	sound __, 3, $88, 1427
	sound __, 3, $78, 1360
	sound __, 3, $b8, 1331
	sound __, 3, $98, 1235
	sound __, 3, $78, 1103
	sound __, 3, $c8, 1331
	sound __, 3, $68, 1316
	sound __, 3, $68, 950
	sound __, 3, $98, 1346
	sound __, 3, $78, 1849
	sound __, 3, $68, 1777
	sound __, 3, $68, 1945
	sound __, 3, $68, 1915
	sound __, 3, $68, 1760
	sound __, 3, $68, 1819
	sound __, 3, $68, 1785
	sound __, 3, $78, 1829
	sound __, 3, $68, 1797
	sound __, 3, $78, 1853
	sound __, 3, $78, 1935
	sound __, 3, $88, 1915
	sound __, 6, $78, 1945
	sound __, 3, $68, 1824
	sound __, 1, $58, 1872
	sound __, 2, $48, 1872
	sound __, 3, $38, 1838
	sound __, 3, $28, 1841
	sound __, 3, $18, 1863
	sound __, 3, $08, 0
	sound __, 3, $08, 0
	sound __, 5, $08, 0
	endchannel

Cry_Yanmega_Ch7:
	sound __, 3, $31, 1637
	sound __, 3, $21, 1637
	sound __, 3, $21, 1702
	sound __, 3, $31, 1675
	sound __, 3, $21, 1652
	sound __, 3, $29, 1580
	sound __, 3, $21, 1647
	sound __, 3, $21, 1637
	sound __, 3, $33, 1613
	sound __, 3, $33, 1608
	sound __, 3, $21, 1647
	sound __, 3, $29, 1691
	sound __, 3, $34, 1938
	sound __, 3, $34, 1936
	sound __, 3, $35, 1933
	sound __, 3, $34, 1936
	sound __, 3, $34, 1941
	sound __, 3, $33, 1943
	sound __, 3, $34, 1946
	sound __, 3, $34, 1949
	sound __, 3, $31, 1949
	sound __, 3, $22, 1958
	sound __, 3, $21, 1996
	sound __, 3, $22, 1957
	sound __, 3, $32, 1959
	sound __, 3, $32, 1961
	sound __, 3, $38, 1625
	sound __, 3, $31, 1965
	sound __, 3, $30, 1968
	sound __, 1, $32, 1969
	sound __, 2, $02, 1969
	sound __, 3, $03, 1967
	sound __, 3, $08, 1657
	sound __, 5, $00, 0
	endchannel

Cry_Yanmega_Ch8:
	noise __, 6, $92, 124
	noise __, 6, $88, 124
	noise __, 6, $84, 124
	noise __, 6, $98, 124
	noise __, 6, $73, 124
	noise __, 6, $93, 124
	noise __, 6, $78, 52
	noise __, 6, $66, 52
	noise __, 6, $74, 52
	noise __, 12, $68, 52
	noise __, 6, $58, 52
	noise __, 6, $54, 36
	noise __, 2, $43, 36
	noise __, 4, $33, 36
	noise __, 5, $23, 36
	noise __, 1, $13, 36
	noise __, 11, $08, 52
	endchannel

; Generated by Siren
; Source: porygon_z.wav
; Play with pitch 0, length 256.
; Stock PSG approximation using square, built-in wave and noise channels.

Cry_Porygon_Z:
	musicheader 4, 5, Cry_porygon_z_Ch5
	musicheader 3, 6, Cry_porygon_z_Ch6
	musicheader 2, 7, Cry_porygon_z_Ch7
	musicheader 1, 8, Cry_porygon_z_Ch8

Cry_porygon_z_Ch5:
	dutycycle $2
	soundinput $08
	sound __, 12, $d8, 1940
	soundinput $67
	sound __, 12, $c8, 1937
	soundinput $47
	sound __, 6, $c8, 1943
	soundinput $4f
	sound __, 4, $98, 1966
	soundinput $67
	sound __, 12, $78, 1948
	soundinput 0, 8
	sound __, 9, $38, 1972
	soundinput $47
	sound __, 10, $28, 1954
	soundinput $27
	sound __, 6, $28, 1922
	soundinput $4f
	sound __, 11, $38, 1957
	soundinput $27
	sound __, 3, $18, 1922
	endchannel

Cry_porygon_z_Ch6:
	sound __, 4, $08, 0
	dutycycle $2
	sound __, 1, $58, 2010
	sound __, 2, $68, 2010
	sound __, 1, $78, 2010
	sound __, 1, $88, 2010
	sound __, 1, $78, 2010
	sound __, 1, $58, 2010
	sound __, 6, $08, 0
	sound __, 1, $78, 1952
	sound __, 1, $48, 1954
	sound __, 3, $08, 0
	sound __, 1, $88, 1949
	sound __, 1, $88, 1956
	sound __, 1, $08, 0
	sound __, 2, $98, 2010
	sound __, 1, $98, 1992
	sound __, 1, $78, 1992
	sound __, 1, $48, 1992
	sound __, 10, $08, 0
	sound __, 1, $48, 2011
	sound __, 1, $38, 2012
	sound __, 1, $28, 2014
	sound __, 12, $08, 0
	sound __, 1, $28, 2010
	sound __, 1, $18, 2009
	sound __, 9, $08, 0
	sound __, 2, $18, 2010
	sound __, 8, $08, 0
	sound __, 1, $48, 2013
	sound __, 1, $28, 2013
	sound __, 7, $08, 0
	endchannel

Cry_porygon_z_Ch7:
	sound __, 17, $11, 2020
	sound __, 1, $12, 1991
	sound __, 1, $11, 1991
	sound __, 1, $11, 2008
	sound __, 1, $11, 2009
	sound __, 1, $15, 1790
	sound __, 2, $11, 2029
	sound __, 1, $11, 2004
	sound __, 2, $11, 2029
	sound __, 1, $12, 1996
	sound __, 2, $11, 2029
	sound __, 1, $10, 1995
	sound __, 1, $17, 1798
	sound __, 1, $17, 1751
	sound __, 2, $11, 2030
	sound __, 1, $21, 2029
	sound __, 1, $11, 1958
	sound __, 1, $11, 1963
	sound __, 1, $15, 1790
	sound __, 1, $26, 1798
	sound __, 1, $11, 1961
	sound __, 1, $21, 2030
	sound __, 1, $21, 2029
	sound __, 1, $21, 1961
	sound __, 1, $29, 1961
	sound __, 1, $21, 1960
	sound __, 6, $21, 2029
	sound __, 1, $31, 2030
	sound __, 1, $32, 1872
	sound __, 1, $31, 2029
	sound __, 1, $28, 1889
	sound __, 4, $31, 2030
	sound __, 1, $34, 1877
	sound __, 1, $31, 2030
	sound __, 1, $24, 1867
	sound __, 1, $21, 2030
	sound __, 2, $31, 2029
	sound __, 1, $31, 2030
	sound __, 2, $31, 2029
	sound __, 1, $21, 2030
	sound __, 1, $11, 2030
	sound __, 1, $31, 2029
	sound __, 1, $21, 2029
	sound __, 2, $31, 2030
	sound __, 1, $21, 2030
	sound __, 1, $21, 2029
	sound __, 1, $31, 2030
	sound __, 2, $21, 2030
	sound __, 2, $31, 2030
	sound __, 1, $39, 1890
	sound __, 1, $31, 2030
	sound __, 1, $00, 0
	endchannel

Cry_porygon_z_Ch8:
	noise __, 1, $88, 100
	noise __, 2, $98, 100
	noise __, 1, $88, 100
	noise __, 1, $a8, 100
	noise __, 1, $b8, 100
	noise __, 1, $d8, 100
	noise __, 1, $c8, 100
	noise __, 1, $b8, 100
	noise __, 1, $a8, 100
	noise __, 2, $c8, 100
	noise __, 1, $a8, 100
	noise __, 1, $b8, 100
	noise __, 1, $a8, 100
	noise __, 2, $b8, 100
	noise __, 1, $98, 100
	noise __, 1, $88, 100
	noise __, 2, $68, 100
	noise __, 2, $98, 100
	noise __, 2, $a8, 100
	noise __, 1, $c8, 100
	noise __, 2, $a8, 100
	noise __, 1, $98, 100
	noise __, 1, $88, 100
	noise __, 1, $68, 100
	noise __, 2, $78, 100
	noise __, 1, $98, 100
	noise __, 1, $a8, 100
	noise __, 1, $68, 100
	noise __, 1, $78, 100
	noise __, 1, $c8, 100
	noise __, 1, $a8, 100
	noise __, 1, $58, 100
	noise __, 1, $68, 100
	noise __, 5, $48, 100
	noise __, 3, $38, 100
	noise __, 1, $58, 100
	noise __, 1, $38, 100
	noise __, 1, $48, 100
	noise __, 2, $28, 100
	noise __, 1, $18, 100
	noise __, 1, $48, 100
	noise __, 3, $28, 100
	noise __, 3, $18, 100
	noise __, 1, $48, 100
	noise __, 1, $38, 100
	noise __, 1, $28, 100
	noise __, 4, $18, 100
	noise __, 1, $48, 100
	noise __, 1, $78, 100
	noise __, 1, $28, 100
	noise __, 1, $38, 100
	noise __, 2, $28, 100
	noise __, 1, $38, 100
	noise __, 1, $48, 100
	noise __, 1, $28, 100
	noise __, 2, $38, 100
	noise __, 1, $28, 100
	noise __, 2, $18, 100
	noise __, 2, $08, 0
	endchannel

Cry_Bonsly:
	musicheader 3, 5, Cry_Bonsly_Ch5
	musicheader 1, 6, Cry_Bonsly_Ch6
	musicheader 1, 8, Cry_Bonsly_Ch8

Cry_Bonsly_Ch5:
	dutycycle $3
	sound __, 2, $b8, 1854
	dutycycle $2
	sound __, 2, $f8, 1822
	sound __, 2, $f8, 1817
	dutycycle $1
	sound __, 2, $88, 1829
	sound __, 2, $68, 1819
	sound __, 2, $28, 1814
	dutycycle $2
	sound __, 2, $88, 1897
	sound __, 2, $f8, 1897
	dutycycle $1
	sound __, 2, $f8, 1899
	sound __, 2, $a8, 1900
	dutycycle $2
	sound __, 2, $98, 1894
	dutycycle $3
	sound __, 2, $68, 1892
	dutycycle $2
	sound __, 2, $38, 1883
	sound __, 2, $58, 1887
	sound __, 2, $38, 1886
	sound __, 2, $38, 1886
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_Bonsly_Ch6:
	dutycycle $2
	sound __, 2, $c8, 1821
	sound __, 2, $d8, 1852
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $28, 1834
	sound __, 2, $88, 1916
	sound __, 2, $f8, 1917
	sound __, 2, $c8, 1914
	dutycycle $3
	sound __, 2, $78, 1914
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	dutycycle $2
	sound __, 2, $28, 1907
	sound __, 2, $38, 1905
	sound __, 2, $28, 1909
	sound __, 2, $28, 1906
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 2, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_Bonsly_Ch8:
	noise __, 2, $b8, 75
	noise __, 2, $78, 75
	noise __, 2, $48, 75
	noise __, 2, $78, 75
	noise __, 2, $48, 75
	noise __, 2, $08, 75
	noise __, 2, $78, 75
	noise __, 2, $f8, 75
	noise __, 2, $78, 75
	noise __, 2, $78, 75
	noise __, 2, $48, 75
	noise __, 2, $48, 75
	noise __, 2, $08, 75
	noise __, 2, $48, 75
	noise __, 2, $08, 75
	noise __, 2, $08, 75
	noise __, 2, $08, 75
	noise __, 2, $08, 75
	noise __, 2, $08, 75
	noise __, 2, $08, 75
	noise __, 1, $08, 75
	endchannel

Cry_Mime_Jr:
	musicheader 3, 5, Cry_mime_jr_Ch5
	musicheader 1, 6, Cry_mime_jr_Ch6
	musicheader 1, 8, Cry_mime_jr_Ch8

Cry_mime_jr_Ch5:
	dutycycle $0
	sound __, 1, $d8, 1923
	dutycycle $1
	sound __, 1, $d8, 1923
	dutycycle $3
	sound __, 1, $d8, 1923
	dutycycle $0
	sound __, 1, $d8, 1827
	sound __, 1, $d8, 1827
	dutycycle $1
	sound __, 1, $c8, 1808
	dutycycle $0
	sound __, 1, $28, 1865
	dutycycle $2
	sound __, 1, $d8, 1876
	dutycycle $1
	sound __, 1, $d8, 1889
	sound __, 1, $d8, 1903
	sound __, 1, $d8, 1897
	sound __, 1, $d8, 1892
	dutycycle $3
	sound __, 1, $c8, 1942
	dutycycle $0
	sound __, 1, $d8, 1935
	sound __, 1, $d8, 1890
	sound __, 1, $d8, 1890
	sound __, 1, $d8, 1846
	dutycycle $2
	sound __, 1, $d8, 1943
	dutycycle $0
	sound __, 1, $d8, 1846
	sound __, 1, $d8, 1879
	sound __, 1, $68, 1880
	sound __, 1, $18, 1890
	sound __, 1, $78, 1845
	dutycycle $2
	sound __, 1, $d8, 1943
	dutycycle $0
	sound __, 1, $d8, 1846
	sound __, 1, $b8, 1879
	sound __, 1, $48, 1879
	sound __, 1, $08, 0
	sound __, 1, $58, 1846
	dutycycle $2
	sound __, 1, $a8, 1943
	dutycycle $0
	sound __, 1, $a8, 1844
	sound __, 1, $78, 1879
	sound __, 1, $28, 1880
	sound __, 1, $08, 0
	sound __, 1, $28, 1846
	dutycycle $2
	sound __, 1, $48, 1943
	dutycycle $0
	sound __, 1, $48, 1843
	sound __, 1, $28, 1879
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_mime_jr_Ch6:
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	dutycycle $2
	sound __, 1, $78, 1928
	sound __, 1, $08, 0
	sound __, 1, $68, 1923
	sound __, 1, $28, 1885
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	sound __, 1, $88, 1889
	sound __, 1, $68, 1909
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	dutycycle $0
	sound __, 1, $68, 1896
	sound __, 1, $58, 1929
	sound __, 1, $68, 1929
	sound __, 1, $58, 1892
	sound __, 1, $08, 0
	sound __, 1, $68, 1743
	sound __, 1, $68, 1792
	sound __, 1, $28, 1794
	sound __, 1, $18, 1851
	sound __, 1, $48, 1742
	sound __, 1, $08, 0
	sound __, 1, $78, 1743
	sound __, 1, $68, 1792
	sound __, 1, $28, 1796
	sound __, 1, $08, 0
	sound __, 1, $28, 1743
	sound __, 1, $08, 0
	sound __, 1, $68, 1745
	sound __, 1, $38, 1792
	sound __, 1, $18, 1794
	sound __, 1, $08, 0
	sound __, 1, $18, 1743
	sound __, 1, $08, 0
	sound __, 1, $28, 1745
	sound __, 1, $18, 1793
	sound __, 1, $08, 0
	sound __, 1, $08, 0
	endchannel

Cry_mime_jr_Ch8:
	noise __, 1, $08, 75
	noise __, 1, $18, 75
	noise __, 1, $38, 75
	noise __, 1, $18, 75
	noise __, 1, $18, 75
	noise __, 1, $48, 75
	noise __, 1, $18, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $28, 75
	noise __, 1, $38, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $18, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $18, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $18, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	noise __, 1, $08, 75
	endchannel

Cry_Happiny:
	musicheader 3, 5, Cry_Happiny_Ch5
	musicheader 1, 7, Cry_Happiny_Ch7
	musicheader 1, 8, Cry_Happiny_Ch8

Cry_Happiny_Ch5:
	dutycycle $1
	sound __, 1, $f8, 1928
	dutycycle $3
	sound __, 1, $f8, 1923
	dutycycle $2
	sound __, 1, $f8, 1972
	dutycycle $3
	sound __, 1, $f8, 1895
	dutycycle $2
	sound __, 1, $98, 1977
	sound __, 1, $f8, 1975
	sound __, 1, $f8, 1974
	dutycycle $3
	sound __, 1, $f8, 1900
	dutycycle $1
	sound __, 1, $c8, 1898
	dutycycle $2
	sound __, 1, $38, 1950
	sound __, 1, $68, 1974
	sound __, 1, $68, 1975
	dutycycle $3
	sound __, 1, $98, 1904
	sound __, 3, $08, 0
	dutycycle $2
	sound __, 1, $f8, 1983
	dutycycle $3
	sound __, 1, $f8, 1919
	dutycycle $1
	sound __, 1, $f8, 1923
	dutycycle $2
	sound __, 1, $c8, 1947
	sound __, 1, $38, 1968
	sound __, 1, $c8, 1968
	dutycycle $3
	sound __, 1, $c8, 1937
	dutycycle $2
	sound __, 1, $c8, 1962
	dutycycle $1
	sound __, 1, $c8, 1882
	dutycycle $2
	sound __, 1, $68, 1960
	sound __, 1, $38, 1966
	sound __, 1, $38, 1987
	sound __, 1, $38, 1992
	sound __, 1, $38, 1993
	sound __, 1, $08, 0
	endchannel

Cry_Happiny_Ch7:
	sound __, 1, $16, 1988
	sound __, 1, $12, 1986
	sound __, 1, $11, 2010
	sound __, 1, $16, 1972
	sound __, 1, $11, 2012
	sound __, 2, $11, 2011
	sound __, 1, $16, 1974
	sound __, 1, $16, 1973
	sound __, 1, $21, 1999
	sound __, 2, $21, 2011
	sound __, 1, $00, 0
	sound __, 1, $36, 1975
	sound __, 1, $31, 2013
	sound __, 1, $31, 2014
	sound __, 1, $11, 2016
	sound __, 1, $16, 1984
	sound __, 1, $16, 1986
	sound __, 1, $12, 1998
	sound __, 1, $31, 2008
	sound __, 1, $11, 2008
	sound __, 1, $12, 1993
	sound __, 1, $11, 2005
	sound __, 1, $12, 1965
	sound __, 1, $21, 2004
	sound __, 1, $31, 2007
	sound __, 1, $21, 2018
	sound __, 1, $31, 2020
	sound __, 2, $31, 2021
	endchannel

Cry_Happiny_Ch8:
	noise __, 8, $08, 0
	noise __, 1, $88, 92
	noise __, 3, $08, 0
	noise __, 1, $88, 92
	noise __, 4, $08, 0
	noise __, 1, $88, 92
	noise __, 1, $f8, 92
	noise __, 1, $88, 92
	noise __, 1, $08, 0
	noise __, 2, $f8, 92
	noise __, 1, $88, 92
	noise __, 7, $08, 0
	endchannel
