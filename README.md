
# Universal Complaint Format (`.ucf`)

A simple, open, TOML-based file format for registering and exchanging citizen
complaints across public or private complaint systems.

## 💡 Overview

The **Universal Complaint Format (UCF)** is designed to make complaint
submission and exchange interoperable across different departmental complaint
systems — from municipal corporations to utility companies.

UCF is:
- **Citizen-facing:** used by apps and web portals that collect complaints.
- **Interoperable:** readable and writable across server systems of different
departments.
- **Extensible:** departments can add optional tables or fields without
breaking compatibility.
- **Verifiable:** complaint file hashes can be stored on blockchains or audit
systems.
- Look at `example.ucf` to get a feel.

## 🔗 Integration Scenarios

- Citizen complaint apps can **generate `.ucf` files** automatically.
- Complaint servers can **parse `.ucf` inputs** for direct registration.
- Blockchain-based systems can **store file hashes** for record verification.

## 🧠 Design Principles

- **Simplicity over power:** one file = one complaint
- **Readable by humans and machines**
- **Secure and privacy-aware**
- **Flexible field extensions**

## 🤝 Contributing

We welcome public feedback and improvements!
Please open an **issue** or a **pull request** with suggestions, discussions,
or example implementations.

Recommended contribution ideas:
- Schema extensions
- Parser implementations
- Security/encryption best practices

## ⚖️ License

Released under the [MIT License](LICENSE).

---

### Maintainers

- @devpraton (Initial author)
- Open community contributors 🌍

---

*Let’s build an open, standard way for citizens to be heard.*
