class CertificateEntity {
  final String id;
  final String title;
  final String? image;
  final DateTime issuedAt;
  final String date;

  const CertificateEntity({
    required this.id,
    required this.title,
    required this.issuedAt,
    required this.date,
    this.image =
        'https://m.media-amazon.com/images/I/817ZMt8IVvS._AC_SL1500_.jpg',
  });
}
