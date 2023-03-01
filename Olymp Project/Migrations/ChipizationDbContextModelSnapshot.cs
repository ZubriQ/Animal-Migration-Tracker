﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Olymp_Project.Models;

#nullable disable

namespace Olymp_Project.Migrations
{
    [DbContext(typeof(ChipizationDbContext))]
    partial class ChipizationDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.13")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("AnimalKind", b =>
                {
                    b.Property<long>("AnimalId")
                        .HasColumnType("bigint");

                    b.Property<long>("KindId")
                        .HasColumnType("bigint");

                    b.HasKey("AnimalId", "KindId")
                        .HasName("PK_AnimalType");

                    b.HasIndex("KindId");

                    b.ToTable("AnimalKind", (string)null);
                });

            modelBuilder.Entity("Olymp_Project.Models.Account", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasMaxLength(320)
                        .HasColumnType("nvarchar(320)");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.HasKey("Id");

                    b.ToTable("Account", (string)null);
                });

            modelBuilder.Entity("Olymp_Project.Models.Animal", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("Id"), 1L, 1);

                    b.Property<int>("ChipperId")
                        .HasColumnType("int");

                    b.Property<DateTime>("ChippingDateTime")
                        .HasColumnType("datetime");

                    b.Property<long>("ChippingLocationId")
                        .HasColumnType("bigint");

                    b.Property<DateTime?>("DeathDateTime")
                        .HasColumnType("datetime");

                    b.Property<string>("Gender")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<float>("Height")
                        .HasColumnType("real");

                    b.Property<float>("Length")
                        .HasColumnType("real");

                    b.Property<string>("LifeStatus")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<float>("Weight")
                        .HasColumnType("real");

                    b.HasKey("Id");

                    b.HasIndex("ChipperId");

                    b.HasIndex("ChippingLocationId");

                    b.ToTable("Animal", (string)null);
                });

            modelBuilder.Entity("Olymp_Project.Models.Kind", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("Id"), 1L, 1);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("Id");

                    b.ToTable("Kind", (string)null);
                });

            modelBuilder.Entity("Olymp_Project.Models.Location", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("Id"), 1L, 1);

                    b.Property<double>("Latitude")
                        .HasColumnType("float");

                    b.Property<double>("Longitude")
                        .HasColumnType("float");

                    b.HasKey("Id");

                    b.ToTable("Location", (string)null);
                });

            modelBuilder.Entity("Olymp_Project.Models.VisitedLocation", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("Id"), 1L, 1);

                    b.Property<long>("AnimalId")
                        .HasColumnType("bigint");

                    b.Property<long>("LocationId")
                        .HasColumnType("bigint");

                    b.Property<DateTime>("VisitDateTime")
                        .HasColumnType("datetime");

                    b.HasKey("Id");

                    b.HasIndex("AnimalId");

                    b.HasIndex("LocationId");

                    b.ToTable("VisitedLocation", (string)null);
                });

            modelBuilder.Entity("AnimalKind", b =>
                {
                    b.HasOne("Olymp_Project.Models.Animal", null)
                        .WithMany()
                        .HasForeignKey("AnimalId")
                        .IsRequired()
                        .HasConstraintName("FK_AnimalType_Animal");

                    b.HasOne("Olymp_Project.Models.Kind", null)
                        .WithMany()
                        .HasForeignKey("KindId")
                        .IsRequired()
                        .HasConstraintName("FK_AnimalType_Type");
                });

            modelBuilder.Entity("Olymp_Project.Models.Animal", b =>
                {
                    b.HasOne("Olymp_Project.Models.Account", "Chipper")
                        .WithMany("Animals")
                        .HasForeignKey("ChipperId")
                        .IsRequired()
                        .HasConstraintName("FK_Animal_Account");

                    b.HasOne("Olymp_Project.Models.Location", "ChippingLocation")
                        .WithMany("Animals")
                        .HasForeignKey("ChippingLocationId")
                        .IsRequired()
                        .HasConstraintName("FK_Animal_Location");

                    b.Navigation("Chipper");

                    b.Navigation("ChippingLocation");
                });

            modelBuilder.Entity("Olymp_Project.Models.VisitedLocation", b =>
                {
                    b.HasOne("Olymp_Project.Models.Animal", "Animal")
                        .WithMany("VisitedLocations")
                        .HasForeignKey("AnimalId")
                        .IsRequired()
                        .HasConstraintName("FK_VisitedLocation_Animal");

                    b.HasOne("Olymp_Project.Models.Location", "Location")
                        .WithMany("VisitedLocations")
                        .HasForeignKey("LocationId")
                        .IsRequired()
                        .HasConstraintName("FK_VisitedLocation_Location");

                    b.Navigation("Animal");

                    b.Navigation("Location");
                });

            modelBuilder.Entity("Olymp_Project.Models.Account", b =>
                {
                    b.Navigation("Animals");
                });

            modelBuilder.Entity("Olymp_Project.Models.Animal", b =>
                {
                    b.Navigation("VisitedLocations");
                });

            modelBuilder.Entity("Olymp_Project.Models.Location", b =>
                {
                    b.Navigation("Animals");

                    b.Navigation("VisitedLocations");
                });
#pragma warning restore 612, 618
        }
    }
}
