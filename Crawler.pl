#!/usr/bin/perl -w
use WWW::Mechanize;
use Term::ANSIColor;
use warnings;
use strict;


print"\n[!]Use EXEMPLE http://www.google.com/ \n";
my $target = "http://55ch.org/b/catalog.html";
my $craw = WWW::Mechanize->new(autocheck => 0);
$craw->get($target);
if($craw->status()=="200"){

	my $pagina_fio = WWW::Mechanize->new(autocheck => 0);
	$pagina_fio->agent_alias('Mac Safari');

#-----------------
	my $craw2 = WWW::Mechanize->new(autocheck => 0);
	$craw2->get("http://www.55ch.org/lit/res/1.html");
	if($craw2->status()=="200"){
		print("Sucessos!\n");
		$craw2->save_content("aqui3.html",binary => 1);
	}else{
		print("Falhou!\n");
	}
#-----------------
	my @links = $craw->links();
	print"RESULTS:\n";
	print"====================================================\n";
	my $cont=0;
	my $falhas=0;
	my $pasta=int(rand(1000))*int(rand(1000));
	mkdir("PaginasSalvas/".$pasta,0777) || die "Não foi possível cria o diretório: $!"; 
	foreach my $link (@links) {
		if($link->url()=~ m/res/) {
			$cont++;
			$pagina_fio->get("http://55ch.org".$link->url());
			if (($cont==60)||($cont==120)||($cont==180)||($cont==200)){sleep(10);}
			if($pagina_fio->status()=="200"){
				my $nome=$link->url();
				$nome =~s/\D//g;
				$pagina_fio->save_content("PaginasSalvas/".$pasta."/".$nome.".html",binary => 1);
				print("[".$cont."]".$link->url()." Sucesso!\n");
			}else{
				$falhas++;
				print("[".$cont."]".$link->url()." Falhou! =(\n");
			}

		}


	}
	print ("Total: ".$cont."\nFalhas: ".$falhas."\n");
	print "\n====================================================\n";
	exit 0;
}else{
	exit 1;
}
# END #
